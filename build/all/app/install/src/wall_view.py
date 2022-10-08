from re import A
import vk_api


vk_session = vk_api.VkApi('+79046012483', 'lolipop676')
vk_session.auth()

vk = vk_session.get_api()

response = vk.wall.get(count=100)

def speak(text):
    if response['items']:
        return response['items'][0]