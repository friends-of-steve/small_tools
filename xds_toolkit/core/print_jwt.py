import jwt
import json
import sys


def read_string(path: str) :
    with open(path, 'r') as file:
        content = file.read()

        file.close()

        return content

def write_json_file(path: str, json_data: {}) :
    with open(path, "w") as file:
        json.dump(json_data, file)
        file.close()


def main_decode():
    print(sys.argv[1])
    jwt_string = read_string(sys.argv[1])

    header = jwt.get_unverified_header(jwt_string)
    payload = jwt.decode(jwt_string, options={"verify_signature": False})

    write_json_file(sys.argv[2], header)
    write_json_file(sys.argv[3], payload)


if __name__ == "__main__":
    main_decode()
