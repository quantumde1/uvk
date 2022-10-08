
import vk_api


vk_session = vk_api.VkApi('+7123456789', 'passwd')
vk_session.auth()

vk = vk_session.get_api()

response = vk.wall.get(count=100)

def speak(text):
    if response['items']:
        return response['items'][0]
