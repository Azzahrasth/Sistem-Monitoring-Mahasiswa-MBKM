<?php

include("config.php");
session_start();

if (!isset($_SESSION["login"])) {
    header("location: signin.php");
    exit;
}
if (!isset($_SESSION["mahasiswa"])) {
    header("location: signout.php");
    exit;
}

// Nambah Konversi Mata Kuliah
if(isset($_GET['id_mhs']) && isset($_GET['id_mk']))
{
    $id_mhs = $_GET['id_mhs'];
    $id_matkul = $_GET['id_mk'];
    $konversi_mk = mysqli_query($conn, "INSERT INTO konversi_mk VALUES ('', '$id_mhs', '$id_matkul', 'Belum diacc')");

    if(mysqli_affected_rows($conn) > 0)
    {
        echo "<script>
            alert('Mata Kuliah Berhasl Dimasukkan!');
            window.location = 'kmk_mhs.php';
        </script>";
    }
}

if(isset($_GET['id_mhs_delete']) && isset($_GET['id_mk_delete']))
{
    $id_mhs = $_GET['id_mhs_delete'];
    $id_matkul = $_GET['id_mk_delete'];

    // DELETE FROM persons WHERE P_Id=25;
    $konversi_mk = mysqli_query($conn, " DELETE FROM konversi_mk WHERE id_mhs = '$id_mhs' && id_matkul = '$id_matkul'");

    if(mysqli_affected_rows($conn) > 0)
    {
        echo "<script>
            alert('Mata Kuliah Berhasil Digagalkan!');
            window.location = 'kmk_mhs.php';
        </script>";
    }
}

$id = $_SESSION["id"];

$query = "SELECT * FROM konversi_mk WHERE id_mhs = '$id'";
$result = mysqli_query($conn, $query);
$id_matkuls = [];
while ($hasil = mysqli_fetch_assoc($result)) {
    $id_matkuls[] = $hasil['id_matkul'];
}

$mahasiswa = mysqli_query($conn, "SELECT nim, nama_mhs, semester FROM mhs WHERE id_mhs = '$id'");
$konversi_mk = mysqli_query($conn, "SELECT * FROM konversi_mk WHERE id_mhs = '$id'");
$mata_kuliah = mysqli_query($conn, "SELECT id_matkul, kode_matkul, nama_matkul, sks, semester_mk, nama_dosen from mata_kuliah JOIN dosen ON mata_kuliah.id_dosen = dosen.id_dosen order by nama_matkul ASC");

// Query untuk mengecek apakah mahasiswa sudah lolos mbkm atau belum
$cek_lolos = mysqli_query($conn, "SELECT status_lolos FROM mengikuti WHERE id_mhs = '$id' AND status_lolos = 'Sudah Lolos'");

// Jika query tidak ada (mahasiswa belum dinyatakan lolos) maka mahasiswa tidak bisa membuka page KMK
if (mysqli_num_rows($cek_lolos)==0)
{
    echo "<script>
            alert('Anda Belum Lolos MBKM!');
            window.location = 'db_mhs.php';
        </script>";
}
else
{
    $_SESSION["mhs_mbkm"] = true;
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
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
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/style2.css" rel="stylesheet" type="text/css" />
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
                        <div
                            class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1">
                        </div>
                    </div>
                    <?php
                    $row = mysqli_fetch_assoc($mahasiswa);

                    ?>

                    <div class="ms-3">
                        <h6 class="mb-0"><?= $row['nama_mhs'] ?></h6>
                        <span>Mahasiswa</span>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                    <a href="db_mhs.php" class="nav-item nav-link"><i
                            class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i
                                class="far fa-file-alt me-2"></i>Lapor MBKM</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="ttd.php" class="dropdown-item">Tanda Tangan</a>
                            <a href="bl_mhs.php" class="dropdown-item">Bukti Lolos</a>
                        </div>
                    </div>
                    <a href="kmk_mhs.php" class="nav-item nav-link active"><i class="fa fa-keyboard me-2"></i>KMK</a>
                    <a href="lmk_mhs.php" class="nav-item nav-link"><i class="fa fa-table me-2"></i>LMK</a>
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

            <!-- Deskripsi Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light text-align: r ghtrounded p-4">
                    <div class="d-flex align-items-center justify-content-around mb-4">
                        <h6 class="mb-0">KONVERSI MATA KULIAH</h6>
                    </div>
                    <h7>
                        Silahkan tambah mata kuliah yang akan di konversikan,
                        pilih mata kuliah sesuai dengan mata kuliah pada bukti lulus program MBKM.
                    </h7>
                </div>
            </div>
            <!-- Deskripsi End -->

            <!-- Table Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-12">
                        <div class="bg-light rounded h-100 p-4">
                            <h6 class="mb-4">Konversi Mata Kuliah</h6>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">No.</th>
                                            <th scope="col">Kode MK</th>
                                            <th scope="col">Nama Matkul</th>
                                            <th scope="col">SKS</th>
                                            <th scope="col">Semester</th>
                                            <th scope="col">Dosen</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                     
                                        <?php
                                        
                                            $nomor = 1;
                                            while($result = mysqli_fetch_assoc($mata_kuliah)){

                                        ?>
                                        <tr>
                                            <th scope="row"><?= $nomor ?></th>
                                            <td><?= $result["kode_matkul"] ?></td>
                                            <td><?= $result["nama_matkul"] ?></td>
                                            <td><?= $result["sks"] ?></td>
                                            <td><?= $result["semester_mk"] ?></td>
                                            <td><?= $result["nama_dosen"] ?></td>

                                            <?php
                                                $flag = 0;
                                                $id_mhs = $_SESSION['id'];
                                                $id_matkul = $result['id_matkul'];

                                                
                                                foreach ($id_matkuls as $id_mk):
                                                    if($id_matkul == $id_mk)
                                                    {
                                                        $flag = 1;
                                                        break;
                                                    }
                                                    else
                                                    {
                                                        $flag = 0;
                                                    }
                                                endforeach;

                                                if($flag == 1)
                                                {
                                                     echo "<td><a href='?id_mhs_delete=" . $id_mhs . "& id_mk_delete=" . $id_matkul . "'>CANCEL</a></td>";
                                                }
                                                else
                                                {
                                                    echo "<td><a href='?id_mhs=" . $id_mhs . "& id_mk=" . $id_matkul . "'>ADD</a></td>";
                                                }
                                            ?>
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