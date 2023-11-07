<?php
if(isset($_POST['name'])) { $name = htmlspecialchars($_POST['name']);}
if(isset($_POST['phone'])) { $phone = htmlspecialchars($_POST['phone']);}
if(isset($_POST['mail'])) { $mail = htmlspecialchars($_POST['mail']);}
if(isset($_POST['message'])) { $message = htmlspecialchars($_POST['message']);}
if(isset($_POST['vrvzam'])) { $vrvzam = htmlspecialchars($_POST['vrvzam']);}
if(isset($_POST['vrvzam2'])) { $vrvzam2 = htmlspecialchars($_POST['vrvzam2']);}
if(isset($_POST['vrvzam3'])) { $vrvzam3 = htmlspecialchars($_POST['vrvzam3']);}
if(isset($_POST['page_url'])) { $page_url = htmlspecialchars($_POST['page_url']);}
 
$result = 0;
            $to = "mebeldk@inbox.ru"; //Здесь надо указать на какую почту будет приходить письмо
            $subject = "Заявка с сайта МДК"; //Название письма
            $text =  "\nИмя - $name<br>
            Телефон - $phone<br>
            Примечание - $message<br>
            E-mail - $mail<br>
            Урл страницы - $page_url<br>";
             
 
    $headers = "MIME-Version: 1.0\r\n";
    $headers .= "Content-type: text/html; charset=utf-8\r\n"; // кодировка письма
    $headers .= "From: С сайта МДК <mebeldk.ru>\r\n"; // от кого письмо
                if($vrvzam=='' and $vrvzam2=='' and $vrvzam3=='vrv'){$sending = mail($to, $subject, $text, $headers);}
             
            if($sending) $result = 1;
            echo $result;
     
?>