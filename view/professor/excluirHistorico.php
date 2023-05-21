<?php
session_start();
include "../../model/conexao.php";

if (empty($_SESSION['token_adm'])) {
  header("location: ../../index.php");

} else {
  if (!empty($_GET['id_bio'])) {
    $id = $_GET['id_bio'];

    $mostre = "SELECT * FROM biografia WHERE id_bio = '$id'";
    $result = $conexao->query($mostre);

    if ($result->num_rows > 0) {
      $excluir = "DELETE FROM biografia WHERE id_bio = '$id'";
      $resultado_excluir = $conexao->query($excluir);
    }
  }
  header("location: visualizarHistorico.php");
}

?>