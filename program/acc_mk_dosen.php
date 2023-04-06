<?php

    include("config.php");
    session_start();

    // Ngecek kesudahan login
    if(!isset($_SESSION["login"]))
    {
        header("location: signin.php");
        exit;
    }
    if(!isset($_SESSION["dosen"]))
    {
        header("location: signout.php");
    }

    // Accept Mata Kuliah
    if(isset($_GET['id_mhs']))
    {
        $id_mhs = $_GET['id_mhs'];
        $id_mk = $_GET['id_mk'];
    }
    if(isset($id_mhs) && isset($id_mk))
    {
        $update_status = mysqli_query($conn, "UPDATE konversi_mk SET status_acc = 'Sudah diacc' WHERE id_mhs = '$id_mhs' AND id_matkul = '$id_mk'");

        // Ngambli SKS MK
        $mata_kuliah = mysqli_query($conn, "SELECT * from mata_kuliah WHERE id_matkul = '$id_mk'");
        $hasil = mysqli_fetch_assoc($mata_kuliah);
        $sks = $hasil['sks'];

        $update_jmlh_sks = mysqli_query($conn, "UPDATE mhs SET jumlah_sks = jumlah_sks + $sks WHERE id_mhs = '$id_mhs'");

        if(mysqli_affected_rows($conn) > 0)
        {
            echo "<script>
                alert('Mata Kuliah Berhasi Di-ACC!');
                window.location = 'acc_mk_dosen.php';
            </script>";
        }
    }

    $id = $_SESSION["id"];
    $mahasiswa = mysqli_query($conn, "SELECT distinct mhs.id_mhs, mhs.nim, mhs.nama_mhs, mhs.semester, mhs.jumlah_sks, mhs.status_mbkm, mata_kuliah.id_dosen FROM mata_kuliah JOIN konversi_mk ON mata_kuliah.id_matkul = konversi_mk.id_matkul JOIN mhs ON mhs.id_mhs = konversi_mk.id_mhs WHERE mata_kuliah.id_dosen = '$id'");
    //$mahasiswa = mysqli_query($conn, "SELECT * FROM mata_kuliah JOIN konversi_mk ON mata_kuliah.id_matkul = konversi_mk.id_matkul JOIN mhs ON mhs.id_mhs = konversi_mk.id_mhs WHERE mata_kuliah.id_dosen = '$id'");
    $dosen = mysqli_query($conn, "SELECT * FROM dosen WHERE id_dosen = '$id'");

?>

<!DOCTYPE html>
<html lang="en">

<head></head>
    <meta charset="utf-8">
    <title>DASHMIN - Bootstrap Admin Template</title>
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
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link href="css/style2.css" rel="stylesheet" type="text/css"/>
</head>

<body>
    <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-light navbar-light">
                <a href="index.html" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>SI_MBKM</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <img class="rounded-circle" src="img/dummy.jpg" alt="" style="width: 40px; height: 40px;">
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">
                        <?php
                                    
                        $row = mysqli_fetch_assoc($dosen);
                        
                        ?>
                        <h6 class="mb-0"><?=$row['nama_dosen']?></h6>
                        <span>Dosen</span>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                <a href="db_dosen.php" class="nav-item nav-link"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                    <a href="acc_mk_dosen.php" class="nav-item nav-link active"><i class="fa fa-table me-2"></i>ACC MK</a>
                    <a href="pm_dosen.php" class="nav-item nav-link"><i class="fa fa-th me-2"></i>PM</a>
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->


        <!-- Content Start -->
        <div class="content">
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0" style="height: 55px;">
                <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                    <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                </a>
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars"></i>
                </a>
                <div class="navbar-nav align-items-center ms-auto">
                    <div class="nav-item dropdown">
                        <a href="signout.php" style="color: #000000; font-weight: 600; letter-spacing: 0.5px;">SIGN OUT</a>
                    </div>
                </div>
            </nav>
            <!-- Navbar End -->

            <!-- Table Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-12">
                        <div class="bg-light rounded h-100 p-4">
                            <h6 class="mb-4">Tabel ACC Mata Kuliah</h6>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">No.</th>
                                            <th scope="col">NIM</th>
                                            <th scope="col">Nama Mahasiswa</th>
                                            <th scope="col">Semester</th>
                                            <th scope="col">Status</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        
                                            $nomor = 1;
                                            while($result = mysqli_fetch_assoc($mahasiswa)){

                                        ?>
                                        <tr>
                                            <th scope="row"><?= $nomor ?></th>
                                            <td><?= $result["nim"] ?></td>
                                            <td><?= $result["nama_mhs"] ?></td>
                                            <td><?= $result["semester"] ?></td>
                                            <td><?= $result["status_mbkm"] ?></td>
                                            <td><a href="acc_mk_detail_dosen.php?key=<?= $result['id_mhs'] ?>">Detail</a></td>
                                        </tr>
                                        <?php
                                        
                                                $nomor++;
                                            }
                                        
                                        ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Table End -->

        </div>
        <!-- Content End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
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