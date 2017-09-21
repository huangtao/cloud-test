.class public Lcom/dtr/zxing/camera/CameraManager;
.super Ljava/lang/Object;
.source "CameraManager.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private autoFocusManager:Lcom/dtr/zxing/camera/AutoFocusManager;

.field private camera:Landroid/hardware/Camera;

.field private final configManager:Lcom/dtr/zxing/camera/CameraConfigurationManager;

.field private final context:Landroid/content/Context;

.field private initialized:Z

.field private final previewCallback:Lcom/dtr/zxing/camera/PreviewCallback;

.field private previewing:Z

.field private requestedCameraId:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const-class v0, Lcom/dtr/zxing/camera/CameraManager;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/dtr/zxing/camera/CameraManager;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    const/4 v0, -0x1

    iput v0, p0, Lcom/dtr/zxing/camera/CameraManager;->requestedCameraId:I

    .line 41
    iput-object p1, p0, Lcom/dtr/zxing/camera/CameraManager;->context:Landroid/content/Context;

    .line 42
    new-instance v0, Lcom/dtr/zxing/camera/CameraConfigurationManager;

    invoke-direct {v0, p1}, Lcom/dtr/zxing/camera/CameraConfigurationManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/dtr/zxing/camera/CameraManager;->configManager:Lcom/dtr/zxing/camera/CameraConfigurationManager;

    .line 43
    new-instance v0, Lcom/dtr/zxing/camera/PreviewCallback;

    iget-object v1, p0, Lcom/dtr/zxing/camera/CameraManager;->configManager:Lcom/dtr/zxing/camera/CameraConfigurationManager;

    invoke-direct {v0, v1}, Lcom/dtr/zxing/camera/PreviewCallback;-><init>(Lcom/dtr/zxing/camera/CameraConfigurationManager;)V

    iput-object v0, p0, Lcom/dtr/zxing/camera/CameraManager;->previewCallback:Lcom/dtr/zxing/camera/PreviewCallback;

    .line 44
    return-void
.end method


# virtual methods
.method public declared-synchronized closeDriver()V
    .locals 1

    .prologue
    .line 107
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/dtr/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    .line 108
    iget-object v0, p0, Lcom/dtr/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->release()V

    .line 109
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/dtr/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 114
    :cond_0
    monitor-exit p0

    return-void

    .line 107
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getCameraResolution()Landroid/graphics/Point;
    .locals 1

    .prologue
    .line 179
    iget-object v0, p0, Lcom/dtr/zxing/camera/CameraManager;->configManager:Lcom/dtr/zxing/camera/CameraConfigurationManager;

    invoke-virtual {v0}, Lcom/dtr/zxing/camera/CameraConfigurationManager;->getCameraResolution()Landroid/graphics/Point;

    move-result-object v0

    return-object v0
.end method

.method public getPreviewSize()Landroid/hardware/Camera$Size;
    .locals 1

    .prologue
    .line 183
    iget-object v0, p0, Lcom/dtr/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    if-eqz v0, :cond_0

    .line 184
    iget-object v0, p0, Lcom/dtr/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getPreviewSize()Landroid/hardware/Camera$Size;

    move-result-object v0

    .line 186
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public declared-synchronized isOpen()Z
    .locals 1

    .prologue
    .line 100
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/dtr/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onConfigurationChanged()V
    .locals 2

    .prologue
    .line 191
    iget-object v0, p0, Lcom/dtr/zxing/camera/CameraManager;->configManager:Lcom/dtr/zxing/camera/CameraConfigurationManager;

    iget-object v1, p0, Lcom/dtr/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v0, v1}, Lcom/dtr/zxing/camera/CameraConfigurationManager;->onConfigurationChanged(Landroid/hardware/Camera;)V

    .line 192
    return-void
.end method

.method public declared-synchronized openDriver(Landroid/view/SurfaceHolder;)V
    .locals 6
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 56
    monitor-enter p0

    :try_start_0
    iget-object v3, p0, Lcom/dtr/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    .line 57
    .local v3, "theCamera":Landroid/hardware/Camera;
    if-nez v3, :cond_2

    .line 59
    iget v4, p0, Lcom/dtr/zxing/camera/CameraManager;->requestedCameraId:I

    if-ltz v4, :cond_0

    .line 60
    iget v4, p0, Lcom/dtr/zxing/camera/CameraManager;->requestedCameraId:I

    invoke-static {v4}, Lcom/dtr/zxing/camera/open/OpenCameraInterface;->open(I)Landroid/hardware/Camera;

    move-result-object v3

    .line 65
    :goto_0
    if-nez v3, :cond_1

    .line 66
    new-instance v4, Ljava/io/IOException;

    invoke-direct {v4}, Ljava/io/IOException;-><init>()V

    throw v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    .end local v3    # "theCamera":Landroid/hardware/Camera;
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4

    .line 62
    .restart local v3    # "theCamera":Landroid/hardware/Camera;
    :cond_0
    :try_start_1
    invoke-static {}, Lcom/dtr/zxing/camera/open/OpenCameraInterface;->open()Landroid/hardware/Camera;

    move-result-object v3

    goto :goto_0

    .line 68
    :cond_1
    iput-object v3, p0, Lcom/dtr/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    .line 70
    :cond_2
    invoke-virtual {v3, p1}, Landroid/hardware/Camera;->setPreviewDisplay(Landroid/view/SurfaceHolder;)V

    .line 72
    iget-boolean v4, p0, Lcom/dtr/zxing/camera/CameraManager;->initialized:Z

    if-nez v4, :cond_3

    .line 73
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/dtr/zxing/camera/CameraManager;->initialized:Z

    .line 74
    iget-object v4, p0, Lcom/dtr/zxing/camera/CameraManager;->configManager:Lcom/dtr/zxing/camera/CameraConfigurationManager;

    invoke-virtual {v4, v3}, Lcom/dtr/zxing/camera/CameraConfigurationManager;->initFromCameraParameters(Landroid/hardware/Camera;)V

    .line 77
    :cond_3
    invoke-virtual {v3}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    .line 78
    .local v0, "parameters":Landroid/hardware/Camera$Parameters;
    if-nez v0, :cond_5

    const/4 v1, 0x0

    .line 82
    .local v1, "parametersFlattened":Ljava/lang/String;
    :goto_1
    :try_start_2
    iget-object v4, p0, Lcom/dtr/zxing/camera/CameraManager;->configManager:Lcom/dtr/zxing/camera/CameraConfigurationManager;

    const/4 v5, 0x0

    invoke-virtual {v4, v3, v5}, Lcom/dtr/zxing/camera/CameraConfigurationManager;->setDesiredCameraParameters(Landroid/hardware/Camera;Z)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 97
    :cond_4
    :goto_2
    monitor-exit p0

    return-void

    .line 78
    .end local v1    # "parametersFlattened":Ljava/lang/String;
    :cond_5
    :try_start_3
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->flatten()Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 83
    .restart local v1    # "parametersFlattened":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 85
    .local v2, "re":Ljava/lang/RuntimeException;
    if-eqz v1, :cond_4

    .line 86
    invoke-virtual {v3}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    move-result-object v0

    .line 87
    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->unflatten(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 89
    :try_start_4
    invoke-virtual {v3, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 90
    iget-object v4, p0, Lcom/dtr/zxing/camera/CameraManager;->configManager:Lcom/dtr/zxing/camera/CameraConfigurationManager;

    const/4 v5, 0x1

    invoke-virtual {v4, v3, v5}, Lcom/dtr/zxing/camera/CameraConfigurationManager;->setDesiredCameraParameters(Landroid/hardware/Camera;Z)V
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_2

    .line 91
    :catch_1
    move-exception v4

    goto :goto_2
.end method

.method public declared-synchronized requestPreviewFrame(Landroid/os/Handler;I)V
    .locals 2
    .param p1, "handler"    # Landroid/os/Handler;
    .param p2, "message"    # I

    .prologue
    .line 154
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/dtr/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    .line 155
    .local v0, "theCamera":Landroid/hardware/Camera;
    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/dtr/zxing/camera/CameraManager;->previewing:Z

    if-eqz v1, :cond_0

    .line 156
    iget-object v1, p0, Lcom/dtr/zxing/camera/CameraManager;->previewCallback:Lcom/dtr/zxing/camera/PreviewCallback;

    invoke-virtual {v1, p1, p2}, Lcom/dtr/zxing/camera/PreviewCallback;->setHandler(Landroid/os/Handler;I)V

    .line 157
    iget-object v1, p0, Lcom/dtr/zxing/camera/CameraManager;->previewCallback:Lcom/dtr/zxing/camera/PreviewCallback;

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setOneShotPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 159
    :cond_0
    monitor-exit p0

    return-void

    .line 154
    .end local v0    # "theCamera":Landroid/hardware/Camera;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized setManualCameraId(I)V
    .locals 1
    .param p1, "cameraId"    # I

    .prologue
    .line 170
    monitor-enter p0

    :try_start_0
    iput p1, p0, Lcom/dtr/zxing/camera/CameraManager;->requestedCameraId:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 171
    monitor-exit p0

    return-void

    .line 170
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized startPreview()V
    .locals 4

    .prologue
    .line 120
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/dtr/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    .line 121
    .local v0, "theCamera":Landroid/hardware/Camera;
    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/dtr/zxing/camera/CameraManager;->previewing:Z

    if-nez v1, :cond_0

    .line 122
    invoke-virtual {v0}, Landroid/hardware/Camera;->startPreview()V

    .line 123
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/dtr/zxing/camera/CameraManager;->previewing:Z

    .line 124
    new-instance v1, Lcom/dtr/zxing/camera/AutoFocusManager;

    iget-object v2, p0, Lcom/dtr/zxing/camera/CameraManager;->context:Landroid/content/Context;

    iget-object v3, p0, Lcom/dtr/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-direct {v1, v2, v3}, Lcom/dtr/zxing/camera/AutoFocusManager;-><init>(Landroid/content/Context;Landroid/hardware/Camera;)V

    iput-object v1, p0, Lcom/dtr/zxing/camera/CameraManager;->autoFocusManager:Lcom/dtr/zxing/camera/AutoFocusManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 126
    :cond_0
    monitor-exit p0

    return-void

    .line 120
    .end local v0    # "theCamera":Landroid/hardware/Camera;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized stopPreview()V
    .locals 3

    .prologue
    .line 132
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/dtr/zxing/camera/CameraManager;->autoFocusManager:Lcom/dtr/zxing/camera/AutoFocusManager;

    if-eqz v0, :cond_0

    .line 133
    iget-object v0, p0, Lcom/dtr/zxing/camera/CameraManager;->autoFocusManager:Lcom/dtr/zxing/camera/AutoFocusManager;

    invoke-virtual {v0}, Lcom/dtr/zxing/camera/AutoFocusManager;->stop()V

    .line 134
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/dtr/zxing/camera/CameraManager;->autoFocusManager:Lcom/dtr/zxing/camera/AutoFocusManager;

    .line 136
    :cond_0
    iget-object v0, p0, Lcom/dtr/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/dtr/zxing/camera/CameraManager;->previewing:Z

    if-eqz v0, :cond_1

    .line 137
    iget-object v0, p0, Lcom/dtr/zxing/camera/CameraManager;->camera:Landroid/hardware/Camera;

    invoke-virtual {v0}, Landroid/hardware/Camera;->stopPreview()V

    .line 138
    iget-object v0, p0, Lcom/dtr/zxing/camera/CameraManager;->previewCallback:Lcom/dtr/zxing/camera/PreviewCallback;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/dtr/zxing/camera/PreviewCallback;->setHandler(Landroid/os/Handler;I)V

    .line 139
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/dtr/zxing/camera/CameraManager;->previewing:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 141
    :cond_1
    monitor-exit p0

    return-void

    .line 132
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
