import vk_api
import login

response = vk.wall.get(count=100)

def speak(text):
    if response['items']:
        return response['items'][0]
