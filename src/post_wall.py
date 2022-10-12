from vklib import VK

def test(client:VK):
  client.api.wall.post(client.id, "Hello, world!")