.class public Lcom/boyaa/engine/device/CameraImpl;
.super Ljava/lang/Object;
.source "CameraImpl.java"


# static fields
.field private static final CAMERA_OPEN_CANCEL:I = 0x0

.field private static final CAMERA_OPEN_ERROR:I = -0x1

.field private static final CAMERA_OPEN_NO_PERMISSION:I = -0x2

.field private static final CAMERA_OPEN_SUCCESS:I = 0x1

.field private static final DEFAULT_CAMERA:I = 0x0

.field private static final FRONT_CAMERA:I = 0x1

.field private static final IMAGE_JPG:I = 0x1

.field private static final IMAGE_PNG:I

.field public static REQ_ID_CAMERA:I

.field public static REQ_ID_CROP:I


# instance fields
.field private cameraImageFile:Ljava/io/File;

.field private cameraImageName:Ljava/lang/String;

.field private cropImageName:Ljava/lang/String;

.field public edit:Z

.field public format:I

.field public height:I

.field public id:I

.field public path:Ljava/lang/String;

.field public quality:I

.field public width:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 28
    sput v0, Lcom/boyaa/engine/device/CameraImpl;->REQ_ID_CAMERA:I

    .line 29
    sput v0, Lcom/boyaa/engine/device/CameraImpl;->REQ_ID_CROP:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/engine/device/CameraImpl;->cameraImageFile:Ljava/io/File;

    .line 46
    return-void
.end method

.method private crop()V
    .locals 8

    .prologue
    .line 164
    :try_start_0
    iget-object v5, p0, Lcom/boyaa/engine/device/CameraImpl;->cameraImageFile:Ljava/io/File;

    invoke-static {v5}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    .line 166
    .local v3, "uri":Landroid/net/Uri;
    iget v5, p0, Lcom/boyaa/engine/device/CameraImpl;->format:I

    if-nez v5, :cond_1

    const-string v5, ".png"

    :goto_0
    invoke-static {v5}, Lcom/boyaa/engine/device/Utils;->randomFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/boyaa/engine/device/CameraImpl;->cropImageName:Ljava/lang/String;

    .line 167
    iget-object v5, p0, Lcom/boyaa/engine/device/CameraImpl;->path:Ljava/lang/String;

    sget-object v6, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v5

    iget-object v6, p0, Lcom/boyaa/engine/device/CameraImpl;->path:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    if-eq v5, v6, :cond_0

    .line 168
    iget-object v5, p0, Lcom/boyaa/engine/device/CameraImpl;->path:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/boyaa/engine/device/CameraImpl;->path:Ljava/lang/String;

    .line 170
    :cond_0
    iget-object v5, p0, Lcom/boyaa/engine/device/CameraImpl;->cameraImageFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    iget v6, p0, Lcom/boyaa/engine/device/CameraImpl;->width:I

    iget v7, p0, Lcom/boyaa/engine/device/CameraImpl;->height:I

    invoke-static {v5, v6, v7}, Lcom/boyaa/engine/device/Utils;->calcScaleSize(Ljava/lang/String;II)Landroid/graphics/Point;

    move-result-object v2

    .line 172
    .local v2, "size":Landroid/graphics/Point;
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "file://"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Lcom/boyaa/engine/device/CameraImpl;->path:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/boyaa/engine/device/CameraImpl;->cropImageName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    .line 173
    .local v4, "uriCrop":Landroid/net/Uri;
    new-instance v1, Landroid/content/Intent;

    const-string v5, "com.android.camera.action.CROP"

    invoke-direct {v1, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 174
    .local v1, "intent":Landroid/content/Intent;
    const-string v5, "image/*"

    invoke-virtual {v1, v3, v5}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 175
    const-string v5, "aspectX"

    const/4 v6, 0x1

    invoke-virtual {v1, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 176
    const-string v5, "aspectY"

    const/4 v6, 0x1

    invoke-virtual {v1, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 177
    const-string v5, "outputX"

    iget v6, v2, Landroid/graphics/Point;->x:I

    invoke-virtual {v1, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 178
    const-string v5, "outputY"

    iget v6, v2, Landroid/graphics/Point;->y:I

    invoke-virtual {v1, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 179
    const-string v5, "scale"

    const/4 v6, 0x1

    invoke-virtual {v1, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 180
    const-string v5, "output"

    invoke-virtual {v1, v5, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 181
    const-string v5, "return-data"

    const/4 v6, 0x0

    invoke-virtual {v1, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 182
    const-string v6, "outputFormat"

    iget v5, p0, Lcom/boyaa/engine/device/CameraImpl;->format:I

    if-nez v5, :cond_2

    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {v5}, Landroid/graphics/Bitmap$CompressFormat;->toString()Ljava/lang/String;

    move-result-object v5

    :goto_1
    invoke-virtual {v1, v6, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 184
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v5

    sget v6, Lcom/boyaa/engine/device/CameraImpl;->REQ_ID_CROP:I

    invoke-virtual {v5, v1, v6}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 189
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "size":Landroid/graphics/Point;
    .end local v3    # "uri":Landroid/net/Uri;
    .end local v4    # "uriCrop":Landroid/net/Uri;
    :goto_2
    return-void

    .line 166
    .restart local v3    # "uri":Landroid/net/Uri;
    :cond_1
    const-string v5, ".jpg"

    goto/16 :goto_0

    .line 182
    .restart local v1    # "intent":Landroid/content/Intent;
    .restart local v2    # "size":Landroid/graphics/Point;
    .restart local v4    # "uriCrop":Landroid/net/Uri;
    :cond_2
    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    invoke-virtual {v5}, Landroid/graphics/Bitmap$CompressFormat;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    goto :goto_1

    .line 185
    .end local v1    # "intent":Landroid/content/Intent;
    .end local v2    # "size":Landroid/graphics/Point;
    .end local v3    # "uri":Landroid/net/Uri;
    .end local v4    # "uriCrop":Landroid/net/Uri;
    :catch_0
    move-exception v0

    .line 186
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 187
    const/4 v5, -0x1

    invoke-direct {p0, v5}, Lcom/boyaa/engine/device/CameraImpl;->onResultFailed(I)V

    goto :goto_2
.end method

.method static native nativeEvent(ILjava/lang/String;)V
.end method

.method private onResultCamera(ILandroid/content/Intent;)V
    .locals 8
    .param p1, "resultCode"    # I
    .param p2, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v7, -0x1

    .line 89
    if-ne p1, v7, :cond_4

    .line 90
    iget-boolean v0, p0, Lcom/boyaa/engine/device/CameraImpl;->edit:Z

    if-eqz v0, :cond_0

    .line 91
    invoke-direct {p0}, Lcom/boyaa/engine/device/CameraImpl;->crop()V

    .line 107
    :goto_0
    return-void

    .line 93
    :cond_0
    iget-object v0, p0, Lcom/boyaa/engine/device/CameraImpl;->cameraImageFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 94
    iget-object v0, p0, Lcom/boyaa/engine/device/CameraImpl;->cameraImageFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lcom/boyaa/engine/device/CameraImpl;->width:I

    iget v2, p0, Lcom/boyaa/engine/device/CameraImpl;->height:I

    iget-object v3, p0, Lcom/boyaa/engine/device/CameraImpl;->path:Ljava/lang/String;

    iget v4, p0, Lcom/boyaa/engine/device/CameraImpl;->format:I

    if-nez v4, :cond_1

    sget-object v4, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    :goto_1
    iget v5, p0, Lcom/boyaa/engine/device/CameraImpl;->quality:I

    invoke-static/range {v0 .. v5}, Lcom/boyaa/engine/device/Utils;->scaleAndSaveBitmap(Ljava/lang/String;IILjava/lang/String;Landroid/graphics/Bitmap$CompressFormat;I)Ljava/lang/String;

    move-result-object v6

    .line 95
    .local v6, "imageName":Ljava/lang/String;
    if-eqz v6, :cond_2

    .line 96
    invoke-direct {p0, v6}, Lcom/boyaa/engine/device/CameraImpl;->onResultSuccess(Ljava/lang/String;)V

    goto :goto_0

    .line 94
    .end local v6    # "imageName":Ljava/lang/String;
    :cond_1
    sget-object v4, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    goto :goto_1

    .line 98
    .restart local v6    # "imageName":Ljava/lang/String;
    :cond_2
    invoke-direct {p0, v7}, Lcom/boyaa/engine/device/CameraImpl;->onResultFailed(I)V

    goto :goto_0

    .line 101
    .end local v6    # "imageName":Ljava/lang/String;
    :cond_3
    invoke-direct {p0, v7}, Lcom/boyaa/engine/device/CameraImpl;->onResultFailed(I)V

    goto :goto_0

    .line 105
    :cond_4
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/boyaa/engine/device/CameraImpl;->onResultFailed(I)V

    goto :goto_0
.end method

.method private onResultCrop(ILandroid/content/Intent;)V
    .locals 1
    .param p1, "resultCode"    # I
    .param p2, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v0, -0x1

    .line 110
    if-ne p1, v0, :cond_1

    .line 111
    if-nez p2, :cond_0

    .line 112
    invoke-direct {p0, v0}, Lcom/boyaa/engine/device/CameraImpl;->onResultFailed(I)V

    .line 119
    :goto_0
    return-void

    .line 114
    :cond_0
    iget-object v0, p0, Lcom/boyaa/engine/device/CameraImpl;->cropImageName:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/boyaa/engine/device/CameraImpl;->onResultSuccess(Ljava/lang/String;)V

    goto :goto_0

    .line 117
    :cond_1
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/boyaa/engine/device/CameraImpl;->onResultFailed(I)V

    goto :goto_0
.end method

.method private onResultFailed(I)V
    .locals 2
    .param p1, "flag"    # I

    .prologue
    .line 49
    iget-object v0, p0, Lcom/boyaa/engine/device/CameraImpl;->cameraImageFile:Ljava/io/File;

    if-eqz v0, :cond_0

    .line 51
    iget-object v0, p0, Lcom/boyaa/engine/device/CameraImpl;->cameraImageFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 52
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/engine/device/CameraImpl;->cameraImageFile:Ljava/io/File;

    .line 54
    :cond_0
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getInstance()Lcom/boyaa/engine/device/Device;

    move-result-object v0

    new-instance v1, Lcom/boyaa/engine/device/CameraImpl$1;

    invoke-direct {v1, p0, p1}, Lcom/boyaa/engine/device/CameraImpl$1;-><init>(Lcom/boyaa/engine/device/CameraImpl;I)V

    invoke-virtual {v0, v1}, Lcom/boyaa/engine/device/Device;->runOnRenderThread(Ljava/lang/Runnable;)V

    .line 60
    return-void
.end method

.method private onResultSuccess(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 63
    iget-object v0, p0, Lcom/boyaa/engine/device/CameraImpl;->cameraImageFile:Ljava/io/File;

    if-eqz v0, :cond_0

    .line 65
    iget-object v0, p0, Lcom/boyaa/engine/device/CameraImpl;->cameraImageFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 66
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/boyaa/engine/device/CameraImpl;->cameraImageFile:Ljava/io/File;

    .line 68
    :cond_0
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getInstance()Lcom/boyaa/engine/device/Device;

    move-result-object v0

    new-instance v1, Lcom/boyaa/engine/device/CameraImpl$2;

    invoke-direct {v1, p0, p1}, Lcom/boyaa/engine/device/CameraImpl$2;-><init>(Lcom/boyaa/engine/device/CameraImpl;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/engine/device/Device;->runOnRenderThread(Ljava/lang/Runnable;)V

    .line 74
    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)Z
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v0, 0x1

    .line 77
    sget v1, Lcom/boyaa/engine/device/CameraImpl;->REQ_ID_CAMERA:I

    if-ne p1, v1, :cond_0

    .line 78
    invoke-direct {p0, p2, p3}, Lcom/boyaa/engine/device/CameraImpl;->onResultCamera(ILandroid/content/Intent;)V

    .line 85
    :goto_0
    return v0

    .line 81
    :cond_0
    sget v1, Lcom/boyaa/engine/device/CameraImpl;->REQ_ID_CROP:I

    if-ne p1, v1, :cond_1

    .line 82
    invoke-direct {p0, p2, p3}, Lcom/boyaa/engine/device/CameraImpl;->onResultCrop(ILandroid/content/Intent;)V

    goto :goto_0

    .line 85
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public open()V
    .locals 6

    .prologue
    const/4 v5, -0x2

    .line 122
    const-string v2, ".jpg"

    invoke-static {v2}, Lcom/boyaa/engine/device/Utils;->randomFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/boyaa/engine/device/CameraImpl;->cameraImageName:Ljava/lang/String;

    .line 123
    iget-object v2, p0, Lcom/boyaa/engine/device/CameraImpl;->path:Ljava/lang/String;

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v2

    iget-object v3, p0, Lcom/boyaa/engine/device/CameraImpl;->path:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-eq v2, v3, :cond_0

    .line 124
    iget-object v2, p0, Lcom/boyaa/engine/device/CameraImpl;->path:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/boyaa/engine/device/CameraImpl;->path:Ljava/lang/String;

    .line 126
    :cond_0
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/boyaa/engine/device/CameraImpl;->path:Ljava/lang/String;

    iget-object v4, p0, Lcom/boyaa/engine/device/CameraImpl;->cameraImageName:Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/boyaa/engine/device/CameraImpl;->cameraImageFile:Ljava/io/File;

    .line 128
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 129
    .local v1, "intent":Landroid/content/Intent;
    const-string v2, "android.media.action.IMAGE_CAPTURE"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 130
    const-string v2, "output"

    iget-object v3, p0, Lcom/boyaa/engine/device/CameraImpl;->cameraImageFile:Ljava/io/File;

    invoke-static {v3}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 132
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_2

    .line 135
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 137
    :try_start_0
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v2

    sget v3, Lcom/boyaa/engine/device/CameraImpl;->REQ_ID_CAMERA:I

    invoke-virtual {v2, v1, v3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 159
    :goto_0
    return-void

    .line 138
    :catch_0
    move-exception v0

    .line 139
    .local v0, "e":Ljava/lang/SecurityException;
    invoke-virtual {v0}, Ljava/lang/SecurityException;->printStackTrace()V

    .line 140
    invoke-direct {p0, v5}, Lcom/boyaa/engine/device/CameraImpl;->onResultFailed(I)V

    goto :goto_0

    .line 143
    .end local v0    # "e":Ljava/lang/SecurityException;
    :cond_1
    invoke-direct {p0, v5}, Lcom/boyaa/engine/device/CameraImpl;->onResultFailed(I)V

    goto :goto_0

    .line 150
    :cond_2
    :try_start_1
    invoke-static {}, Lcom/boyaa/engine/device/Device;->getActivity()Landroid/app/Activity;

    move-result-object v2

    sget v3, Lcom/boyaa/engine/device/CameraImpl;->REQ_ID_CAMERA:I

    invoke-virtual {v2, v1, v3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_0

    .line 151
    :catch_1
    move-exception v0

    .line 152
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    invoke-virtual {v0}, Landroid/content/ActivityNotFoundException;->printStackTrace()V

    .line 153
    const/4 v2, -0x1

    invoke-direct {p0, v2}, Lcom/boyaa/engine/device/CameraImpl;->onResultFailed(I)V

    goto :goto_0

    .line 154
    .end local v0    # "e":Landroid/content/ActivityNotFoundException;
    :catch_2
    move-exception v0

    .line 155
    .local v0, "e":Ljava/lang/SecurityException;
    invoke-virtual {v0}, Ljava/lang/SecurityException;->printStackTrace()V

    .line 156
    invoke-direct {p0, v5}, Lcom/boyaa/engine/device/CameraImpl;->onResultFailed(I)V

    goto :goto_0
.end method
