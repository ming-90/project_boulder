"""module for DB connect.
- Author: Minki Lee
- Email: minki@annotation-ai.com
"""

from typing import Any, Dict, List

import psycopg2


class DataImport:  # pylint: disable=too-few-public-methods
    """Data import class."""

    def __init__(self, query: str) -> None:
        """Init data import."""
        self.data = self.__connect(query)

    def __connect(self, query: str) -> Dict[str, Any]:
        """Connect Data Base."""
        conn = psycopg2.connect(
            host="118.36.80.100",
            port="55512",
            dbname="boulder",
            user="postgres",
            password="4123",
        )

        with conn.cursor() as cur:
            cur.execute(query)
            column_names = [desc[0] for desc in cur.description]
            row = cur.fetchall()
        conn.close()

        return self.__list2json(data=row, column=column_names)

    @staticmethod
    def __list2json(data: List[Any], column: List[Any]) -> Dict[str, Any]:
        """Convert list to json."""
        json_lists = []

        for value in data:
            col_info = {column[idx]: value[idx] for idx in range(len(value))}
            json_lists.append(col_info)
        return {"column": json_lists}