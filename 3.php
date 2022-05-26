<?php
$link=mysqli_connect('192.168.29.150','ce2_21','ce2_21','ce2_21');
session_start();
//if(isset($_POST['submit'])){
$toid=$_GET['id'];

$fromid=$_SESSION['username'];
//      $sql="SELECT * FROM users WHERE username = $user";
//      $result = mysqli_query($link,$sql);
//      $row=mysqli_fetch_assoc($resul

if($_SERVER['REQUEST_METHOD']=='POST'){
        $mess=$_POST['message'];

        $sql="INSERT INTO `chat`( `toid`, `fromid`, `mess`) VALUES ('$toid','$fromid','$mess')";
        mysqli_query($link,$sql);
}

?>

<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Tailwind CSS Response Chat  Template</title>
    <script src="https://cdn.tailwindcss.com"></script>
  </head>

  <body>
    <div class="container mx-auto">
      <div class="min-w-full border rounded lg:grid lg:grid-cols-3">
        <div class="border-r border-gray-300 lg:col-span-1">
          <div class="mx-3 my-3">
            <div class="relative text-gray-600">
              <span class="absolute inset-y-0 left-0 flex items-center pl-2">
                <svg fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  viewBox="0 0 24 24" class="w-6 h-6 text-gray-300">
                  <path d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                </svg>
              </span>
              <input type="search" class="block w-full py-2 pl-10 bg-gray-100 rounded outline-none" name="search"
                placeholder="Search" required />
            </div>
          </div>

          <ul class="overflow-auto h-[32rem]">
            <h2 class="my-2 mb-2 ml-2 text-lg text-gray-600">Chats</h2>
            <li>
              <?php
        $sql="SELECT * FROM users";
        $result=mysqli_query($link,$sql);
        while($row=mysqli_fetch_assoc($result)){
                if($row['username']!= $fromid){
?>
        <a href="index.php?id=<?=$row['username']?>"
                class="flex items-center px-3 py-2 text-sm transition duration-150 ease-in-out bg-gray-100 border-b border-gray-300 cursor-pointer focus:outline-none">
                <img class="object-cover w-10 h-10 rounded-full"
                  src="https://cdn.pixabay.com/photo/2016/06/15/15/25/loudspeaker-1459128__340.png" alt="" />
                <div class="w-full pb-2">
                  <div class="flex justify-between">
                  <span class="block ml-2 font-semibold text-gray-600"><?=$row['username']?></span>
                    <span class="block ml-2 text-sm text-gray-600">50 minutes</span>
                  </div>
                  <span class="block ml-2 text-sm text-gray-600">Good night</span>
                </div>
              </a>
<?php }}?>
            </li>
          </ul>
        </div>
<?php
if(isset($_GET['id'])){
?>
        <div class="hidden lg:col-span-2 lg:block">
          <div class="w-full">
            <div class="relative flex items-center p-3 border-b border-gray-300">
              <img class="object-cover w-10 h-10 rounded-full"
                src="https://cdn.pixabay.com/photo/2018/01/15/07/51/woman-3083383__340.jpg" alt="" />
                <span class="block ml-2 font-bold text-gray-600"><?=$_GET['id']?></span>
              <span class="absolute w-3 h-3 bg-green-600 rounded-full left-10 top-3">
              </span>
            </div>
            <div class="relative w-full p-6 overflow-y-auto h-[40rem]">
              <ul class="space-y-2">
<?php
        $sql="SELECT * FROM chat WHERE (toid = '$toid' AND fromid= '$fromid') OR (fromid = '$toid' AND toid= '$fromid')";
        $result = mysqli_query($link,$sql);
        while($row1=mysqli_fetch_assoc($result)){
                if($row1['toid'] != $toid){
?>
<li class="flex justify-start">
                  <div class="relative max-w-xl px-4 py-2 text-gray-700 rounded shadow">
                  <span class="block"><?=$row1['mess']?></span>
                  </div>
                </li>
<?php }else{?>
                <li class="flex justify-end">
                  <div class="relative max-w-xl px-4 py-2 text-gray-700 bg-gray-100 rounded shadow">
                  <span class="block"><?=$row1['mess']?></span>
                  </div>
                </li>
<?php }}?>
              </ul>
            </div>
            <form action="index.php?id=<?=$toid?>" method="post">
            <div class="flex items-center justify-between w-full p-3 border-t border-gray-300">


              <input type="text" placeholder="Message"
                class="block w-full py-2 pl-4 mx-3 bg-gray-100 rounded-full outline-none focus:text-gray-700"
                name="message" required />


              <button type="submit" name="submit">
                <svg class="w-5 h-5 text-gray-500 origin-center transform rotate-90" xmlns="http://www.w3.org/2000/svg"
                  viewBox="0 0 20 20" fill="currentColor">
                  <path
                    d="M10.894 2.553a1 1 0 00-1.788 0l-7 14a1 1 0 001.169 1.409l5-1.429A1 1 0 009 15.571V11a1 1 0 112 0v4.571a1 1 0 00.725.962l5 1.428a1 1 0 001.17-1.408l-7-14z" />
                </svg>
              </button>
            </div>
</form>
<?php } ?>
          </div>
        </div>
      </div>
    </div>
  </body>

</html>

