from vklib import VK

def test(client:VK):
  client.api.wall.post(
    owner_id=client.id,
    message="Hello, world!"
  )