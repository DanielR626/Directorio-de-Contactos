<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agenda de Contactos</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap">

    <style>
        /* Estilos adicionales para el formulario */
        form {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: 0 auto;
            position: relative;
            z-index: 2; /* Asegura que esté encima del fondo animado */
        }

        form label {
            font-weight: bold;
        }

        form .form-control {
            margin-bottom: 15px;
        }

        form button {
            display: block;
            width: 100%;
        }
        
    </style>

    <style>
        /* Estilos de la animación de fondo */
        .area {
            background: #4e54c8;
            background: -webkit-linear-gradient(to left, #8f94fb, #4e54c8);
            width: 100%;
            height: 100vh;
            position: relative;
            overflow: hidden;
        }

        .circles {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }

        .circles li {
            position: absolute;
            display: block;
            list-style: none;
            width: 20px;
            height: 20px;
            background: rgba(255, 255, 255, 0.2);
            animation: animate 25s linear infinite;
            bottom: -150px;
        }
        .circles li:nth-child(1) {
      left: 25%;
      width: 80px;
      height: 80px;
      animation-delay: 0s;
    }

    .circles li:nth-child(2) {
      left: 10%;
      width: 20px;
      height: 20px;
      animation-delay: 2s;
      animation-duration: 12s;
    }

    .circles li:nth-child(3) {
      left: 70%;
      width: 20px;
      height: 20px;
      animation-delay: 4s;
    }

    .circles li:nth-child(4) {
      left: 40%;
      width: 60px;
      height: 60px;
      animation-delay: 0s;
      animation-duration: 18s;
    }

    .circles li:nth-child(5) {
      left: 65%;
      width: 20px;
      height: 20px;
      animation-delay: 0s;
    }

    .circles li:nth-child(6) {
      left: 75%;
      width: 110px;
      height: 110px;
      animation-delay: 3s;
    }

    .circles li:nth-child(7) {
      left: 35%;
      width: 150px;
      height: 150px;
      animation-delay: 7s;
    }

    .circles li:nth-child(8) {
      left: 50%;
      width: 25px;
      height: 25px;
      animation-delay: 15s;
      animation-duration: 45s;
    }

    .circles li:nth-child(9) {
      left: 20%;
      width: 15px;
      height: 15px;
      animation-delay: 2s;
      animation-duration: 35s;
    }

    .circles li:nth-child(10) {
      left: 85%;
      width: 150px;
      height: 150px;
      animation-delay: 0s;
      animation-duration: 11s;
    }


        @keyframes animate {
            0% {
                transform: translateY(0) rotate(0deg);
                opacity: 1;
                border-radius: 0;
            }
            100% {
                transform: translateY(-1000px) rotate(720deg);
                opacity: 0;
                border-radius: 50%;
            }
        }
     

    </style>
    <style>
    /* Custom Styles */
    .custom-form {
      background-color: #f8f9fa;
      padding: 30px;
      border-radius: 10px;
    }
    .custom-btn {
      background-color: #007bff;
      border-color: #007bff;
    }
    .custom-btn:hover {
      background-color: #0056b3;
      border-color: #0056b3;
    }
  </style>
</head>

<body>

    <div class="area">
        <ul class="circles">
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
            <li></li>
        </ul>

        <!-- Barra de navegación -->
      <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: rgba(211, 211, 211, 0.5);">
    <div class="container d-flex justify-content-center"> <!-- Utilizamos justify-content-center para centrar horizontalmente -->
        <a class="navbar-brand" href="#" style="font-family: 'Roboto', sans-serif; font-size: 24px;">AGENDA DE CONTACTOS</a>
    </div>
</nav>


        <div class="container pb-5 mt-5">

  <div class="row">

    <div class="col-lg-6">
    
      <form action="SvAgenda" method="POST">

        <div class="form-group">
          <label>Nombres:</label>
          <input type="text" class="form-control" name="nombres" required>
        </div>

        <div class="form-group">
          <label>Apellidos:</label>
          <input type="text" class="form-control" name="apellidos" required>
        </div>

        <div class="form-group">
          <label>Correo electrónico:</label>
          <input type="email" class="form-control" name="correo" required pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}">
        </div>

        <div class="form-group">
          <label>Dirección:</label>
          <input type="text" class="form-control" name="direccion">  
        </div>

        <div class="form-group">
          <label>Teléfono:</label>
          <input type="number" class="form-control" name="telefono" pattern="" required>
        </div>

        <button type="submit" class="btn btn-primary">Enviar</button>

      </form>

    </div>
      <div class="col-lg-6">
            <div class="image-container">
                <img src="https://cdni.iconscout.com/illustration/premium/thumb/contact-us-2739534-2283924.png" alt="Contact Us" class="contact-image">
                <div class="row mt-4">

    
    </div>

  </div>
  
  <div class="row mt-4">

    <div class="col-lg-6">

      <div class="d-flex justify-content-end">
      
        <form action="SvAgenda" method="GET">
        
          <input type="hidden" name="accion" value="mostrarContactos">
        
          <button type="submit" class="btn btn-outline-primary">Ver Contactos</button>
        
        </form>
      
      </div>

    </div>

  </div>
 
    




    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
