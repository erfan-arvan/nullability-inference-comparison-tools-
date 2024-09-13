import pandas as pd

# Load the dataset
df = pd.read_csv('differences.tsv', sep='\t')

# Define the total sample size
total_sample_size = 378

# Create a new column 'stratum' based on the presence of values in 'kind', 'wpi', 'nullgtn', and 'annotator'
def create_stratum(row):
    kind = row['kind']
    wpi = 'wpi' if pd.notna(row['wpi']) and str(row['wpi']).strip() else 'null'
    nullgtn = 'nullgtn' if pd.notna(row['nullgtn']) and str(row['nullgtn']).strip() else 'null'
    annotator = 'annotator' if pd.notna(row['annotator']) and str(row['annotator']).strip() else 'null'
    return f"{kind}-{wpi}-{nullgtn}-{annotator}"

df['stratum'] = df.apply(create_stratum, axis=1)

# Group by the new stratum column
strata = df.groupby('stratum')

# Calculate the sample size for each stratum proportional to its size
stratum_sample_sizes = strata.size() / len(df) * total_sample_size

# Ensure each stratum has at least one sample
stratum_sample_sizes = stratum_sample_sizes.round().astype(int)
stratum_sample_sizes[stratum_sample_sizes == 0] = 1

# Adjust total sample size if necessary
if stratum_sample_sizes.sum() != total_sample_size:
    difference = total_sample_size - stratum_sample_sizes.sum()
    # Distribute the difference proportionally
    adjustment_per_stratum = difference // len(stratum_sample_sizes)
    stratum_sample_sizes += adjustment_per_stratum
    # If there's still a remainder, distribute it
    remaining_adjustment = difference % len(stratum_sample_sizes)
    for i in range(remaining_adjustment):
        stratum_sample_sizes.iloc[i] += 1

# Perform stratified sampling
sampled_df = strata.apply(lambda x: x.sample(n=stratum_sample_sizes[x.name], random_state=1))

# Drop the multi-level index created by groupby
sampled_df.reset_index(drop=True, inplace=True)

# Save the sampled data to a new CSV file
sampled_df.to_csv('sampled_dataset.csv', index=False)

# Display the sampled data
print(sampled_df.head())
