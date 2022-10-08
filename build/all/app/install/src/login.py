'''
 Copyright (C) 2022  Arseniy Meserakov

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; version 3.

 uvk is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
'''

import vk_api

def login(number, passwd):
  vk_session = vk_api.VkApi('+79046012483', 'lolipop676')
  try:
        vk_session.auth(token_only=True)
  except vk_api.AuthError as error_msg:
        return error_msg

  vk = vk_session.get_api()