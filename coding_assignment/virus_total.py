import requests


apikey = 'fca7991131298140d5e0d6df988e91668e96466ef387def4ec4fea44d4a60599'


header = {
        'X-Apikey': apikey
    }

data = {
        'url': 'www.elementor.com'
    }

id = requests.request("POST", url='https://www.virustotal.com/api/v3/urls',  headers=header, data=data).json()['data']['id']

print(id)

analyse_response = requests.request("GET", url=f'https://www.virustotal.com/api/v3/urls/{id}',  headers=header)

'''
 I Got stuck here with responses of 'Resource not found'.
 Preferred to have an architectural design than to spend time on the tech. 
'''

print(analyse_response.json())