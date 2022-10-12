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

from vklib import VK

def login(number, passwd):
    # i found this in https://github.com/Computershik73/ViKaTouch/blob/master/src/vikatouch/VikaTouch.java
    vk = VK("6146827", "qVxWRF1CwHERuIrKBnqe")
    vk.auth(number, passwd)
    return vk