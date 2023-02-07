---
title: Getting started with dbt
---
# Getting started with dbt
We use Data Build Tool (dbt) to create, test and run data transformations within our Data Warehouse (BigQuery).


## Installation

### Using Python Virtualenv

Please consult [Official DBT guidelines][dbt-install] to install DBT in your
local environment.

    # Create a virtual environment in this directory
    python3 -m venv dbt-env
    source dbt-env/bin/activate

    # Install dbt-bigquery 
    pip install dbt-bigquery

during the installation of dbt-bigquery fill the steps indicating the GCP project,the bigquery dataset and the region and be sure you have the right permission associated with the used account

Remember to run `source dbt-env/bin/activate` everytime you want to enter the
virtual environment again.

you will need to check the dbt user profile created at `~/.dbt/profiles.yml` and validate the correctness of all the fields.

#### Example of `profiles.yml` (don't forget to change the dataset name and the project name)

```yaml
google_analytics_dbt:
  outputs:
    dev:
      dataset: <the_dataset_name>
      job_execution_timeout_seconds: 300
      job_retries: 1
      location: US
      method: oauth
      priority: interactive
      project: <your_GCP_project>
      threads: <number_of_threads_for parallel_execution>
      type: bigquery
  target: dev
```


Make sure you have the [Google Cloud SDK][cloud-sdk-install] installed.

# Using dbt

## Create development tables in your dataset

    dbt run
Run all the modules and create the corresponding Tables in your defined dataset

## Create development dataset in your dataset

    dbt run --select distinct_country_count  total_page_views
Run only the specified modules

## test the result of tables

    dbt test
Test your output

## run the modules in parallel

    dbt run --threads 3
check the number of threads you defined in `~/.dbt/profiles.yml`
you can only select specific modules to be run in parallel by adding the --select <list_of_modules>

## Documentation

    dbt docs serve

To generate the documentation, please run this command (you can also have the lineage graph)
human readable report

## logs


Logs are generated in the folder dbt-logs.
We can use better logging by installing the dep in packages.ym and then create a macro to use in the models (Next Step)
example: 
# models/my_model.sql

{% set logger = import("logs.logging") %}

{{ logger.setup_logging() }}

{{ logger.log_info("Starting to build my model") }}

... (your model SQL code) ...

{{ logger.log_info("Finished building my model") }}







