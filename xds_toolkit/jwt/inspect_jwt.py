'''
  inspect_jwt.py
  Uses the PyJWT module to inspect the contents of a JWT in the context
  or RCE/QHIN testing.
  See https://pyjwt.readthedocs.io/en/stable/#
'''


import jwt
import json
import sys
import time
import urllib.request


def read_string(path: str) :
    with open(path, 'r') as file:
        content = file.read()

        file.close()

        return content

def write_json_file(path: str, json_data: {}) :
    with open(path, "w") as file:
        json.dump(json_data, file)
        file.close()

def write_empty_file(path: str) :
    with open(path, "w") as file:
        file.close()

def main_decode():
    print(sys.argv[1])
    jwt_string = read_string(sys.argv[1])
    if not jwt_string:
        write_empty_file(sys.argv[2])
        write_empty_file(sys.argv[3])

    else:
        header = jwt.get_unverified_header(jwt_string)
        payload = jwt.decode(jwt_string, options={"verify_signature": False})
        write_json_file(sys.argv[2], header)
        write_json_file(sys.argv[3], payload)




def inspect_01(jwt_string:str, header:{}, payload:{}) -> None:
    function_name = sys._getframe().f_code.co_name

    header_typ = header['typ']
    if header_typ != 'JWT':
        print(f"{function_name} ERROR Header type {header_typ} not expected value TYP")
    else:
        print(f"{function_name} PASS Header type correct {header_typ}")




def inspect_02(jwt_string:str, header:{}, payload:{}) -> None:
    function_name = sys._getframe().f_code.co_name

    iat = payload['iat']
    if not iat:
        print(f"{function_name} ERROR Payload iat missing")
    else:
        print(f"{function_name} PASS Payload iat present {iat}")

def inspect_03(jwt_string:str, header:{}, payload:{}) -> None:
    function_name = sys._getframe().f_code.co_name

    iat = payload['iat']
    epoch_time = int(time.time())
    if iat > epoch_time:
        print(f"{function_name} ERROR Payload iat {iat} > current epoch time {epoch_time}")
    else:
        print(f"{function_name} PASS Payload iat {iat} <= current time {epoch_time}")

def inspect_04(jwt_string:str, header:{}, payload:{}) -> None:
    function_name = sys._getframe().f_code.co_name

    iat = payload['iat']
    localtime = time.localtime(iat)
    if not localtime:
        print(f"{function_name} ERROR Payload iat {iat} not converted to localtime")
    else:
        print(f"{function_name} PASS Payload iat {iat} converts to {time.asctime(localtime)}")

def inspect_05(jwt_string:str, header:{}, payload:{}) -> None:
    function_name = sys._getframe().f_code.co_name

    iss = payload['iss']
    if not iss:
        print(f"{function_name} ERROR Payload iss missing")
    else:
        print(f"{function_name} PASS Payload iss present {iss}")


def inspect_06(jwt_string:str, header:{}, payload:{}) -> None:
    function_name = sys._getframe().f_code.co_name

    iss = payload['iss']
    url = f"{iss}/.well-known/openid-configuration"
    openid_configuration = urllib.request.urlopen(url).read()
    if not iss:
        print(f"{function_name} ERROR OpenID Configuration NOT found at {url}")
    else:
        print(f"{function_name} PASS Payload OpenID Configuration  found at {url}")
        print(f"{function_name} PASS {openid_configuration.decode('utf-8')}")

# Check for required claims in OpenID Provider Metadata
# See https://openid.net/specs/openid-connect-discovery-1_0.html#ProviderConfig
def inspect_07(jwt_string:str, header:{}, payload:{}) -> None:
    function_name = sys._getframe().f_code.co_name

    iss = payload['iss']
    url = f"{iss}/.well-known/openid-configuration"
    openid_configuration = urllib.request.urlopen(url).read()
    provider_claims = json.loads(openid_configuration)

    required_claims = ['issuer', 'authorization_endpoint', 'jwks_uri', 'response_types_supported', 'subject_types_supported', 'id_token_signing_alg_values_supported']
    for claim in required_claims:
        if claim not in provider_claims:
            print(f"{function_name} ERROR OpenID required claim missing: {claim}")
        else:
            provider_claim = provider_claims[claim]
            print(f"{function_name} PASS Payload OpenID required claim key   {claim}")
            print(f"{function_name} PASS Payload OpenID required claim value {provider_claim}")


# Check for recommended claims in OpenID Provider Metadata
# See https://openid.net/specs/openid-connect-discovery-1_0.html#ProviderConfig
def inspect_08(jwt_string:str, header:{}, payload:{}) -> None:
    function_name = sys._getframe().f_code.co_name

    iss = payload['iss']
    url = f"{iss}/.well-known/openid-configuration"
    openid_configuration = urllib.request.urlopen(url).read()
    provider_claims = json.loads(openid_configuration)

    recommended_claims = ['userinfo_endpoint', 'claims_supported']
    for claim in recommended_claims:
        if claim not in provider_claims:
            print(f"{function_name} WARNING OpenID recommended claim missing: {claim}")
        else:
            provider_claim = provider_claims[claim]
            print(f"{function_name} PASS Payload OpenID recommended claim key   {claim}")
            print(f"{function_name} PASS Payload OpenID recommended claim value {provider_claim}")

# Check for optional claims in OpenID Provider Metadata
# See https://openid.net/specs/openid-connect-discovery-1_0.html#ProviderConfig
def inspect_09(jwt_string:str, header:{}, payload:{}) -> None:
    function_name = sys._getframe().f_code.co_name

    iss = payload['iss']
    url = f"{iss}/.well-known/openid-configuration"
    openid_configuration = urllib.request.urlopen(url).read()
    provider_claims = json.loads(openid_configuration)

    optional_claims = ['response_modes_supported', 'grant_types_supported',
                       'acr_values_supported', 'id_token_encryption_alg_values_supported',
                       'id_token_encryption_enc_values_supported', 'userinfo_signing_alg_values_supported',
                       'userinfo_encryption_alg_values_supported', 'userinfo_encryption_enc_values_supported',
                       'request_object_signing_alg_values_supported', 'request_object_encryption_alg_values_supported',
                       'request_object_encryption_enc_values_supported', 'token_endpoint_auth_methods_supported',
                       'token_endpoint_auth_signing_alg_values_supported', 'display_values_supported',
                       'claim_types_supported', 'service_documentation',
                       'claims_locales_supported', 'ui_locales_supported',
                       'claims_parameter_supported', 'request_parameter_supported',
                       'request_uri_parameter_supported', 'require_request_uri_registration',
                       'op_policy_uri', 'op_tos_uri']
    for claim in optional_claims:
        if claim not in provider_claims:
            print(f"{function_name} WARNING OpenID optional claim missing: {claim}")
        else:
            provider_claim = provider_claims[claim]
            print(f"{function_name} PASS Payload OpenID optional claim key   {claim}")
            print(f"{function_name} PASS Payload OpenID optional claim value {provider_claim}")

# Check for conditional claims in OpenID Provider Metadata
# See https://openid.net/specs/openid-connect-discovery-1_0.html#ProviderConfig
def inspect_10(jwt_string:str, header:{}, payload:{}) -> None:
    function_name = sys._getframe().f_code.co_name

    iss = payload['iss']
    url = f"{iss}/.well-known/openid-configuration"
    openid_configuration = urllib.request.urlopen(url).read()
    provider_claims = json.loads(openid_configuration)

    condiitonal_claims = ['token_endpoint']
    for claim in condiitonal_claims:
        if claim not in condiitonal_claims:
            print(f"{function_name} WARNING OpenID conditional claim missing: {claim}")
        else:
            provider_claim = provider_claims[claim]
            print(f"{function_name} PASS Payload OpenID conditional claim key   {claim}")
            print(f"{function_name} PASS Payload OpenID conditional claim value {provider_claim}")


def main_inspect():
    jwt_string = read_string(sys.argv[1])
    header  = jwt.get_unverified_header(jwt_string)
    payload = jwt.decode(jwt_string, options={"verify_signature": False})
    inspect_01(jwt_string, header, payload)
    inspect_02(jwt_string, header, payload)
    inspect_03(jwt_string, header, payload)
    inspect_04(jwt_string, header, payload)
    inspect_05(jwt_string, header, payload)
    inspect_06(jwt_string, header, payload)
    inspect_07(jwt_string, header, payload)
    inspect_08(jwt_string, header, payload)
    inspect_09(jwt_string, header, payload)
    inspect_10(jwt_string, header, payload)

if __name__ == "__main__":
    main_inspect()
