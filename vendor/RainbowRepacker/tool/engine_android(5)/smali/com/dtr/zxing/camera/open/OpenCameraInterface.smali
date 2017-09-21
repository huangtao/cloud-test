.class public Lcom/dtr/zxing/camera/open/OpenCameraInterface;
.super Ljava/lang/Object;
.source "OpenCameraInterface.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 7
    const-class v0, Lcom/dtr/zxing/camera/open/OpenCameraInterface;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/dtr/zxing/camera/open/OpenCameraInterface;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static open()Landroid/hardware/Camera;
    .locals 1

    .prologue
    .line 62
    const/4 v0, -0x1

    invoke-static {v0}, Lcom/dtr/zxing/camera/open/OpenCameraInterface;->open(I)Landroid/hardware/Camera;

    move-result-object v0

    return-object v0
.end method

.method public static open(I)Landroid/hardware/Camera;
    .locals 7
    .param p0, "cameraId"    # I

    .prologue
    const/4 v5, 0x0

    .line 19
    invoke-static {}, Landroid/hardware/Camera;->getNumberOfCameras()I

    move-result v4

    .line 20
    .local v4, "numCameras":I
    if-nez v4, :cond_0

    .line 21
    const/4 v0, 0x0

    .line 52
    :goto_0
    return-object v0

    .line 24
    :cond_0
    if-ltz p0, :cond_3

    const/4 v2, 0x1

    .line 26
    .local v2, "explicitRequest":Z
    :goto_1
    if-nez v2, :cond_2

    .line 28
    const/4 v3, 0x0

    .line 29
    .local v3, "index":I
    :goto_2
    if-lt v3, v4, :cond_4

    .line 38
    :cond_1
    move p0, v3

    .line 42
    .end local v3    # "index":I
    :cond_2
    if-ge p0, v4, :cond_5

    .line 43
    invoke-static {p0}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    move-result-object v0

    .line 44
    .local v0, "camera":Landroid/hardware/Camera;
    goto :goto_0

    .end local v0    # "camera":Landroid/hardware/Camera;
    .end local v2    # "explicitRequest":Z
    :cond_3
    move v2, v5

    .line 24
    goto :goto_1

    .line 30
    .restart local v2    # "explicitRequest":Z
    .restart local v3    # "index":I
    :cond_4
    new-instance v1, Landroid/hardware/Camera$CameraInfo;

    invoke-direct {v1}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 31
    .local v1, "cameraInfo":Landroid/hardware/Camera$CameraInfo;
    invoke-static {v3, v1}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 32
    iget v6, v1, Landroid/hardware/Camera$CameraInfo;->facing:I

    if-eqz v6, :cond_1

    .line 35
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 45
    .end local v1    # "cameraInfo":Landroid/hardware/Camera$CameraInfo;
    .end local v3    # "index":I
    :cond_5
    if-eqz v2, :cond_6

    .line 46
    const/4 v0, 0x0

    .line 47
    .restart local v0    # "camera":Landroid/hardware/Camera;
    goto :goto_0

    .line 48
    .end local v0    # "camera":Landroid/hardware/Camera;
    :cond_6
    invoke-static {v5}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    move-result-object v0

    .restart local v0    # "camera":Landroid/hardware/Camera;
    goto :goto_0
.end method
