defmodule Broadcaster.StreamChannel do
  use Phoenix.Channel
  use Timex
  require Logger

  def join("stream", message, socket) do
    Logger.log :info, "Someone joined the stream"
    :timer.send_interval 5_000, :rando
    {:ok, socket}
  end

  def handle_info(:rando, socket) do
    timestamp = DateTime.today |> Timex.format!("{ISO:Extended}")
    broadcast! socket, "new:event", %{id: UUID.uuid4(), message: rando(), created_at: timestamp}
    {:noreply, socket}
  end

  def rando() do
    lorem = """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ut elit vulputate, vestibulum massa non, congue mauris. Morbi sodales interdum neque, nec semper velit vestibulum id. Suspendisse et nibh eget risus luctus ultricies vitae eget magna. Curabitur pharetra placerat venenatis. Quisque gravida eleifend tortor, id venenatis velit laoreet et. In scelerisque pellentesque libero quis vehicula. Pellentesque sit amet euismod nunc. In ac hendrerit nibh.
    Cras iaculis dolor dolor, ac consequat elit placerat id. In quis porta enim. Aliquam rutrum efficitur odio, a rhoncus leo imperdiet sed. Donec sed magna eleifend, blandit lacus nec, convallis mi. Vestibulum sollicitudin mauris eget elit rutrum, nec elementum arcu consectetur. Sed scelerisque ligula eu tellus dapibus, eu viverra nisl hendrerit. Sed sit amet euismod nulla, eget pellentesque purus. Curabitur ante nisi, molestie at bibendum ac, commodo eu augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Ut faucibus cursus placerat. Mauris ut iaculis enim. Quisque quis justo iaculis est posuere vestibulum. Integer pellentesque quis lectus vel pellentesque. In varius arcu sit amet sollicitudin commodo. Vestibulum id maximus arcu.
    Duis lobortis aliquam ullamcorper. Proin diam massa, ornare sit amet elit a, luctus vestibulum ligula. Donec sollicitudin sapien at dolor faucibus, ac tincidunt eros bibendum. Nulla congue sit amet dui sit amet euismod. Sed ac metus maximus est imperdiet facilisis at eget lorem. Nam aliquet ultrices consequat. Curabitur non justo nec lectus viverra pellentesque at pretium tellus. Nulla dapibus accumsan efficitur. Quisque efficitur interdum ante id ullamcorper. Nunc imperdiet rhoncus tellus sed convallis. Vivamus vestibulum fringilla urna, eget facilisis magna rutrum sit amet. Morbi eget urna nunc. Suspendisse velit est, porta quis posuere id, sollicitudin eget libero. Aliquam eu molestie libero. Etiam viverra vel urna molestie convallis. Nunc sed efficitur quam.
    Vivamus nibh lorem, placerat vitae ex eu, luctus dapibus metus. Pellentesque sapien nunc, dapibus vel pulvinar non, euismod eu ante. Fusce egestas hendrerit sollicitudin. Donec nec quam dignissim, porttitor metus et, dictum neque. Maecenas aliquam felis fringilla elementum accumsan. In lectus orci, molestie vel faucibus at, tincidunt in purus. Quisque elementum elit sed est congue gravida. Aenean elementum ultricies tempor. Morbi sit amet vestibulum ligula. Vivamus et nulla in felis gravida iaculis. Vestibulum varius ex ac volutpat venenatis. Pellentesque commodo dolor vel arcu aliquam, eget euismod metus blandit. Fusce commodo quis lacus ac commodo. Fusce tristique at nisi sit amet accumsan. Curabitur viverra aliquam lacus, et malesuada magna mollis sit amet.
    Maecenas maximus, odio a fringilla rutrum, est odio sagittis felis, at ornare nunc est non risus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In finibus convallis metus vitae dapibus. Sed feugiat nulla vitae elit tincidunt molestie. Vestibulum sed venenatis eros. Sed at euismod nisi, sit amet venenatis nunc. Curabitur ornare, est id pellentesque condimentum, arcu nulla commodo orci, accumsan aliquam urna arcu at ante. Aenean eget nulla sit amet nisi commodo fermentum.
    """
    lorem
    |> String.split(". ")
    |> Enum.random
  end
end
