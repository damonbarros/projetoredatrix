<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../assets/css/style.css">
    <title>Document</title>
</head>
<body>
        <?php
        include("../../model/conexao.php");
        session_start();
        $pagina = filter_input(INPUT_GET, "pagina", FILTER_SANITIZE_NUMBER_INT);
            // calcular o início visualização
            $qnt_result_pg = 3; // quantidade de registro por página
            $inicio = ($pagina * $qnt_result_pg) - $qnt_result_pg;

            $sql = "SELECT * FROM redacoes ORDER BY id_redacao DESC LIMIT $inicio, $qnt_result_pg";
            $resultado = $conexao->query($sql);
            echo mysqli_error($conexao);
        $dados = "";

        if($resultado->num_rows > 0) {
        while($row = mysqli_fetch_assoc($resultado)){ 
            $id = $row['id_redacao'];
            $tema = $row["tema"];
            $autor = $row["autor"];
            $nota = $row["nota"];
            $redacao = $row["redacao"];
            $comentarios = $row["comentarios"];
            
            $dados .= "<p class='p-monitor'><strong>Tema: </strong> " . $tema . "</p>";
            $dados .="<p class='p-monitor'><strong>Autor: </strong> " . $autor . "</p>";
            $dados .="<p class='p-nota'><strong>Nota: </strong> " . $nota . "</p>";
            $dados .="<p class='p-monitor'><strong>Redação: </strong> " . "<div class='p-redacao'>$redacao</div>" . "</p><br>";
            $dados .="<p class='p-comentario'><strong>Comentários: </strong> " . $comentarios . "</p>";
            $dados .= "</br>";
            $dados .="<hr>";
                      
        }

        //paginação -> somar a quantidade
         $pg = "SELECT COUNT(id_redacao) AS num_result FROM redacoes";

        $result_pg = $conexao->query($pg);
        $row_pg = $result_pg->fetch_assoc();

        //Quantidade de páginas
        $quantidade_pg = ceil($row_pg['num_result'] / $qnt_result_pg); // ceil -> arredonda o valor sempre para cima
        $max_links = 2;

        $dados .= "<nav aria-label='Page navigation example'><ul class='pagination justify-content-center'>";
        $dados .= "<li class='page-item'>
        <a class='page-link' href='#' onclick='listarRedacao(1)'>Primeira página</a>
        </li>";

        for($pagina_ant = $pagina - $max_links; $pagina_ant <= $pagina -1; $pagina_ant++ ) {
            if($pagina_ant >= 1){
                $dados .= "<li class='page-item'><a class='page-link' onclick='listarRedacao($pagina_ant)' href='#'>$pagina_ant</a></li>";
            } 
        }
        $dados .= "<li class='page-item active'><a class='page-link' href='#'>$pagina</a></li>";

        for($pag_dep = $pagina +1; $pag_dep <= $pagina + $max_links; $pag_dep++){
            if($pag_dep <= $quantidade_pg){
                $dados .= "<li class='page-item'><a class='page-link' href='#' onclick='listarRedacao($pag_dep)'>$pag_dep</a></li>";
            }
        }

        $dados .= "<li class='page-item'><a class='page-link' href='#' onclick='listarRedacao($quantidade_pg)'>Última página</a></li>";
        $dados .= "</ul></nav>";

        echo "$dados";
        } else {
            echo "Erro: nenhum usuário encontrado";
        }
        ?>
</body>
</html>

