<?php

    function getUserById($id){
        global $conn;

        $stmt = $conn->prepare("SELECT * FROM public.users WHERE public.users.id = ?");

        $stmt->execute(array($id));
        return $stmt->fetch();
    }

?>