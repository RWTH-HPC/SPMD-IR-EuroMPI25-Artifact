# Part of RMARaceBench, under BSD-3-Clause License
# See https://github.com/RWTH-HPC/RMARaceBench/LICENSE for license information.
# SPDX-License-Identifier: BSD-3-Clause

import pandas
import argparse
import numpy

parser = argparse.ArgumentParser(description='Process some integers.')
parser.add_argument('results_file', metavar='results_file',
                    help='Results from test runs in CSV format')
parser.add_argument('-o', dest='output_file',
                    help='Results from test runs in CSV format')
parser.add_argument('--verbose', dest='verbose', action='store_true')
parser.add_argument('--total-only', dest='total_only', action='store_true')
parser.add_argument('--latex', dest='latex', action='store_true')
parser.add_argument('--filter', dest='filter', choices=['conflict', 'sync', 'atomic', 'hybrid', 'miscellaneous', 'total'], default='total', type=str)
parser.add_argument('--no-header', dest='no_header', action='store_true')

# fixed order of tools
tool_order = ['SPMDIR', 'PARCOACH-static', 'PARCOACH-dynamic', 'MUST-RMA', 'MUST-TSan', 'RMASanitizer', 'RMASanitizer-NoOpt']

def guarded_div(dividend, divisor):
    if divisor == 0:
        return 0
    else:
        return dividend / divisor

def get_tool_statistics(data, tool):
    results = data.value_counts().to_dict()
    #print(results)

    tp = results['TP'] if 'TP' in results else 0
    fp = results['FP'] if 'FP' in results else 0
    tn = results['TN'] if 'TN' in results else 0
    fn = results['FN'] if 'FN' in results else 0
    to = results['TO'] if 'TO' in results else 0
    cr = results['CR'] if 'CR' in results else 0

    total = tp + fp + tn + fn
    p = tp + fn
    n = fp + tn

    precision = guarded_div(tp, (tp + fp))
    recall = guarded_div(tp, (tp + fn))
    specificity = guarded_div(tn, n)
    accuracy = guarded_div((tp + tn), total)

    out = {
        (tool, 'TP'): tp,
        (tool, 'TN'): tn,
        (tool, 'FP'): fp,
        (tool, 'FN'): fn,
        (tool, 'TO'): to,
        (tool, 'CR'): cr,
        (tool, 'P'): precision,
        (tool, 'R'): recall,
        (tool, 'A'): accuracy
    }

    return out

def get_derived_metrics(data, tool):
    results = data.value_counts().to_dict()
    #print(results)
    tp = results['TP'] if 'TP' in results else 0
    fp = results['FP'] if 'FP' in results else 0
    tn = results['TN'] if 'TN' in results else 0
    fn = results['FN'] if 'FN' in results else 0

    total = tp + fp + tn + fn
    p = tp + fn
    n = fp + tn

    precision = guarded_div(tp, (tp + fp))
    recall = guarded_div(tp, (tp + fn))
    specificity = guarded_div(tn, n)
    accuracy = guarded_div((tp + tn), total)

    # out = {
    #    'Precision': precision,
    #    'Recall': recall,
    #    'Accuracy': accuracy
    # }

    return [precision, recall, accuracy]

def get_tool_table(df, tool):
    discipline_dict = { discipline : get_tool_statistics(df.loc[df['discipline'] == discipline][tool], tool) for discipline in df['discipline'].unique()}
    discipline_dict['total'] = get_tool_statistics(df[tool], tool)

    return pandas.DataFrame.from_dict(discipline_dict, orient='index')

def get_tool_table2(df, tool):
    mux = pandas.MultiIndex.from_product([df['discipline'].unique(), ['P', 'R', 'A']])
    metrics = [metric for discipline in df['discipline'].unique() for metric in get_derived_metrics(df.loc[df['discipline'] == discipline][tool], tool)]
    df = pandas.DataFrame([metrics], columns=mux, index=[tool])
    #print(df.to_string(float_format="%.2f"))
    #exit()
    return df

def get_discipline_statistics(df):
    return pandas.concat([get_tool_table(df, tool) for tool in tools], axis=1)

def get_statistics(df):
    return pandas.DataFrame([get_tool_statistics(df[tool], tool) for tool in tools])


args = parser.parse_args()

df = pandas.read_csv(args.results_file, index_col=0)

# extract tools from columns (first column is discipline)
tools = df.columns.to_list()[1:]

if args.verbose:
    out = pandas.DataFrame.from_dict({tool : get_derived_metrics(df[tool], tool) for tool in tools} ,orient='index')
    if args.latex:
        print(df.to_latex()) # full data frame   
        print(out.to_latex(float_format="%.2f", header=not args.no_header)) # metrics
    else:
        print(df.to_string()) # full data frame   
        print()
        #print(out.to_string(float_format="%.2f", header=not args.no_header)) # metrics

    out = get_discipline_statistics(df)
    if args.latex:
        print(out.to_latex(float_format="%.2f", header=not args.no_header))
    else:
        print(out.to_string(float_format="%.2f", header=not args.no_header))


if not args.total_only:
    for discipline in df['discipline'].unique():
        print(f"=== {discipline} ===")
        out = pandas.concat(
            [get_tool_table(df, tool).loc[[discipline]].droplevel(0, axis=1).rename(index={discipline: tool}) for tool in tool_order if tool in tools])
        if args.latex:
            print(out.to_latex(float_format="%.2f", header=not args.no_header))
        else:
            print(out.to_string(float_format="%.2f", header=not args.no_header))
    # out = pandas.concat(
    #         [get_tool_table2(df, tool).rename(index={args.filter: tool}) for tool in tool_order if tool in tools])
    # if args.latex:
    #     print(out.to_latex(float_format="%.2f", header=not args.no_header))
    # else:
    #     print(out.to_string(float_format="%.2f", header=not args.no_header))

print("=== Total ===")
out = pandas.concat(
    [get_tool_table(df, tool).loc[[args.filter]].droplevel(0, axis=1).rename(index={args.filter: tool}) for tool in tool_order if tool in tools])
if args.latex:
    print(out.to_latex(float_format="%.2f", header=not args.no_header))
else:
    print(out.to_string(float_format="%.2f", header=not args.no_header))

# LaTeX tables
# with pandas.option_context("max_colwidth", 1000):
#     print(df.drop(columns=['discipline']).to_latex(index_names=False))
#     print(get_discipline_statistics(df).to_latex(float_format="%.2f"))

