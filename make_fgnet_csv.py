import argparse
import os
import numpy as np
import utils
import pandas as pd
import re
from glob import glob
parser = argparse.ArgumentParser()
parser.add_argument('--db_name',
                    required=True,
                    choices=['fgnet'],
                    help='Dataset name')
parser.add_argument('--path',
                    required=True,
                    help="Path to dataset folder")




def make_from_fgnet(path: str):
    """Create .csv file as db from FGNET dataset
    Parameters
    ----------
    path : string
        Path to FGNET dataset folder
    """

    pattern = path + '/images/*.JPG'
    paths = glob(pattern)
    data = pd.DataFrame()
    data['full_path'] = paths
    data['db_name'] = path
    p = re.compile('[0-9]+')

    def get_age(row: str):
        flname = row.split('/')[-1]
        age = flname.split('.')[0].split('A')[-1]
        age = p.match(age).group()
        return int(age)
    data['age'] = data['full_path'].map(get_age)

    def clean_path(row: str):
        return '/'.join(row.split('/')[1:])
    data['full_path'] = data['full_path'].map(clean_path)
    data.to_csv('fgnet_cleaned.csv', columns=['db_name', 'full_path', 'age'], index=False)




def main():
    args = parser.parse_args()
    DB = args.db_name
    PATH = args.path
    command = {'fgnet': make_from_fgnet,}
    command[DB](PATH)


if __name__ == '__main__':
    main()
