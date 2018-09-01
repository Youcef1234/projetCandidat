<?php

session_start();
session_destroy();
echo 'You have been logged out. <a href="http://localhost/ProjetCandidat/projetCandidat/#!/login">Go back</a>';