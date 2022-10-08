import vk_api
import login


def post_wall_message(text):
  print(vk.wall.post(message=text))