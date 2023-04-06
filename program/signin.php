<?php

    session_start();
    
    include("config.php");
    // Cek Cookie
    if(isset($_COOKIE['id']) && isset($_COOKIE['key']))
    {
        $id = $_COOKIE['id'];
        $key = $_COOKIE['key'];

        // Ambil username berdasarkan id
        $result = mysqli_query($conn, "SELECT * FROM user WHERE id_user = $id");
        $row = mysqli_fetch_assoc($result);

        // Bandingkan cookie dan username
        if($key === hash('sha256', $row['email']))
        {
            $_SESSION['login'] = true;
            $_SESSION['email'] = $row['email'];
        }
    }
    
    if(isset($_SESSION["login"]))
    {
        if($row["status"] === "mahasiswa")
        {
            $_SESSION["id"] = $row['id_mhs'];
            $_SESSION["mahasiswa"] = true;
            header("location: db_mhs.php");
            exit;
        }
        else {
            $_SESSION["id"] = $row['id_dosen'];
            $_SESSION["dosen"] = true;
            header("location: db_dosen.php");
            exit;
        }
    }

    if(isset($_POST["login"]))
    {
        if(($_POST["email"] == 'admin') && ($_POST['password'] == 'admin1234'))
        {
            header("Location: db_admin.php");
            $_SESSION["admin"] = true;
            $_SESSION["login"] = true;
        }

        $email = $_POST["email"];
        $password = $_POST["password"];

        $result = mysqli_query($conn, "SELECT * FROM user WHERE email = '$email'");
        
        // Cek ketersediaan Username
        if(mysqli_num_rows($result) === 1) 
        {
            $row = mysqli_fetch_assoc($result);
            // Cek kesamaan password
            if($password === $row["password"])
            {
                // Set Session
                $_SESSION["login"] = true;

                // Set Session Buat Nampilin Nama User
                // $_SESSION["nama"] = $row["nama_lengkap"];

                // Cek Remember Me
                if(isset($_POST['remember']))
                {
                    // Set Cookie
                    setcookie('id', $row['id_user'], time()+3600);
                    setcookie('key', hash('sha256', $row['email']), time()+3600);
                }
                
                if($row["status"] === "mahasiswa")
                {
                    $_SESSION["id"] = $row['id_mhs'];
                    $_SESSION["mahasiswa"] = true;
                    header("location: db_mhs.php");
                    exit;
                }
                else {
                    $_SESSION["id"] = $row['id_dosen'];
                    $id_dosen = $_SESSION["id"];
                    $_SESSION["dosen"] = true;
                    $pm = mysqli_query($conn, "SELECT * FROM pm WHERE jumlah_mhs_mbkm > 0 AND id_dosen = '$id_dosen'");
                    $hasil = mysqli_fetch_assoc($pm);
                    if(isset($hasil))
                    {
                        $_SESSION["pm"] = $hasil['id_pm'];
                    }
                    header("location: db_dosen.php");
                    exit;
                }
            }
            else {
                echo "<script>
                    alert('Password Salah!');
                </script>";
            }
        }
        else 
        {
            echo "<script>
                    alert('Username Tidak Terdaftar!');
                    window.location = 'signin.php';
                </script>";
        }
    }

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Login</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Sign In Start -->
        <div class="container-fluid">
            <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                    <div class="bg-light rounded p-4 p-sm-5 my-4 mx-3">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <a href="index.html" class="">
                                <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>SI_MBKM</h3>
                            </a>
                            <h3>Login</h3>
                        </div>
                        <form action="" method="post">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" name="email" id="floatingInput" placeholder="name@example.com" required>
                                <label for="floatingInput">Email address</label>
                            </div>
                            <div class="form-floating mb-4">
                                <input type="password" class="form-control" name="password" id="floatingPassword" placeholder="Password" required>
                                <label for="floatingPassword">Password</label>
                            </div>
                            <div class="d-flex align-items-center justify-content-between mb-4">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="exampleCheck1" name="remember">
                                    <label class="form-check-label" for="exampleCheck1">Remember me</label>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary py-3 w-100 mb-4" name="login">Login</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Sign In End -->
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/chart/chart.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>