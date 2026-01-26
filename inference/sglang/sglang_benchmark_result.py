import json
import csv
import re

def main():
    file_path = 'tmp.log'
    with open(file_path, 'r') as f:
        content = f.read()

    # Split the content into individual JSON strings
    # Assuming each JSON object starts with '{' at the beginning of a line or after newline
    json_strings = re.findall(r'\{.*?\}(?=\s*\{|\s*$)', content, re.DOTALL)

    entries = []
    for js in json_strings:
        if js.strip():
            try:
                entry = json.loads(js)
                entries.append(entry)
            except json.JSONDecodeError as e:
                print(f"Error parsing JSON: {e}")

    # Define the fields to extract
    #fieldnames = [
    #    'backend', 'max_concurrency', 'random_input_len', 'random_output_len',
    #    'duration', 'completed', 'total_input_tokens', 'total_output_tokens',
    #    'request_throughput', 'input_throughput', 'output_throughput', 'total_throughput',
    #    'mean_e2e_latency_ms', 'mean_ttft_ms', 'mean_tpot_ms', 'mean_itl_ms', 'concurrency'
    #]
    fieldnames = [
        'backend', 'max_concurrency', 'concurrency', 'random_input_len', 'random_output_len',
        'duration', 'completed', 'input_throughput', 'output_throughput' , 'total_throughput','request_throughput',
        'median_e2e_latency_ms', 'p99_ttft_ms', 'p99_tpot_ms'
    ]

    # Write to CSV
    output_path = 'organized_data.csv'
    with open(output_path, 'w', newline='') as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        for entry in entries:
            row = {field: entry.get(field) for field in fieldnames}
            writer.writerow(row)

    print(f"Data organized and saved to {output_path}")

if __name__ == '__main__':
    main()
