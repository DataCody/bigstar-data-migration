from setuptools import find_packages, setup

setup(
    name="bigstar-data-migration",
    version="0.1.0",
    description="BigStar data migration orchestrated by Dagster + dbt + Airbyte",
    packages=find_packages(),
    python_requires=">=3.9,<3.12",
    install_requires=[
        "dbt-redshift>=1.7,<1.9",
        "dagster>=1.6,<1.8",
        "dagster-dbt>=0.23,<0.25",
        "dagster-airbyte>=0.23,<0.25",
    ],
    extras_require={
        "dev": ["dagit", "pytest"],
        "cloud": ["dagster-cloud>=1.6,<1.8"],
    },
    include_package_data=True,
    package_data={
        "bigstar_data_migration": [
            "dbt_project/**/*.sql",
            "dbt_project/**/*.yml",
        ],
    },
)