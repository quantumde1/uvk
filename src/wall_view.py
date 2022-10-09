import vk_api
import login

response = vk.wall.get(count=1)

def speak():
    if response['items']:
        return response['items'][0]
