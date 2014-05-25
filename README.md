Realchat
========

Usage:

* Start 2 iex shells via ```iex --name "foo" -S mix``` and ```iex --name "bar" -S mix```
* Connect the two(only on one shell): ```Node.ping(:"tim@nebuchadnezzar.local")``` (replace nebuchadnezzar with the hostname shown on the other shell)
* Verify 'pong' is returned
* Start the GenEvent-Server on shell 1: ```{:ok, pid} = GenEvent.start_link()```
* Register the eventhandler globally on shell 1: ```:global.register_name(:gen_event, pid)```
* On Shell one: Register: ```GenEvent.call(pid, Server, {:register, self()})```
* On Shell two:
  * Find the remote PID ``` pid = :global.whereis_name(:gen_event)```
  * Register: ```GenEvent.call(pid, Server, {:register, self()})```
* Send a message from any of the shells: ```GenEvent.notify(pid, {:message, "test"})```
* Flush the local mailbox on the two shells: ```flush()```
