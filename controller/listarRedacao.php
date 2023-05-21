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
        include("../model/conexao.php");
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
            $dados .="<a class='btnClean' class='btn btn-primary' href='../../controller/excluirDados.php?id_redacao=$row[id_redacao]'>
            <svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-trash3' viewBox='0 0 16 16'>
                <path d='M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z'/>
            </svg>
            </a> ";

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

