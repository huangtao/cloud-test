.class public final Lcom/dtr/zxing/activity/CaptureActivity;
.super Landroid/app/Activity;
.source "CaptureActivity.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final ADD_EDGE:I

.field private beepManager:Lcom/dtr/zxing/utils/BeepManager;

.field private button:Landroid/widget/Button;

.field private cameraManager:Lcom/dtr/zxing/camera/CameraManager;

.field private handler:Lcom/dtr/zxing/utils/CaptureActivityHandler;

.field private inactivityTimer:Lcom/dtr/zxing/utils/InactivityTimer;

.field private isHasSurface:Z

.field private mCropRect:Landroid/graphics/Rect;

.field private scanContainer:Landroid/widget/RelativeLayout;

.field private scanCropView:Landroid/widget/RelativeLayout;

.field private scanLine:Landroid/widget/ImageView;

.field private scanPreview:Landroid/view/SurfaceView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 46
    const-class v0, Lcom/dtr/zxing/activity/CaptureActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/dtr/zxing/activity/CaptureActivity;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 44
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 60
    iput-object v0, p0, Lcom/dtr/zxing/activity/CaptureActivity;->scanPreview:Landroid/view/SurfaceView;

    .line 66
    iput-object v0, p0, Lcom/dtr/zxing/activity/CaptureActivity;->mCropRect:Landroid/graphics/Rect;

    .line 69
    const/16 v0, 0xa

    iput v0, p0, Lcom/dtr/zxing/activity/CaptureActivity;->ADD_EDGE:I

    .line 79
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/dtr/zxing/activity/CaptureActivity;->isHasSurface:Z

    .line 44
    return-void
.end method

.method private getStatusBarHeight()I
    .locals 6

    .prologue
    .line 254
    :try_start_0
    const-string v5, "com.android.internal.R$dimen"

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 255
    .local v0, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    .line 256
    .local v3, "obj":Ljava/lang/Object;
    const-string v5, "status_bar_height"

    invoke-virtual {v0, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 257
    .local v2, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 258
    .local v4, "x":I
    invoke-virtual {p0}, Lcom/dtr/zxing/activity/CaptureActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    .line 262
    .end local v0    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "field":Ljava/lang/reflect/Field;
    .end local v3    # "obj":Ljava/lang/Object;
    .end local v4    # "x":I
    :goto_0
    return v5

    .line 259
    :catch_0
    move-exception v1

    .line 260
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 262
    const/4 v5, 0x0

    goto :goto_0
.end method

.method private initCamera(Landroid/view/SurfaceHolder;)V
    .locals 5
    .param p1, "surfaceHolder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 179
    if-nez p1, :cond_0

    .line 180
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "No SurfaceHolder provided"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 182
    :cond_0
    iget-object v2, p0, Lcom/dtr/zxing/activity/CaptureActivity;->cameraManager:Lcom/dtr/zxing/camera/CameraManager;

    invoke-virtual {v2}, Lcom/dtr/zxing/camera/CameraManager;->isOpen()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 198
    :goto_0
    return-void

    .line 187
    :cond_1
    :try_start_0
    iget-object v2, p0, Lcom/dtr/zxing/activity/CaptureActivity;->cameraManager:Lcom/dtr/zxing/camera/CameraManager;

    invoke-virtual {v2, p1}, Lcom/dtr/zxing/camera/CameraManager;->openDriver(Landroid/view/SurfaceHolder;)V

    .line 188
    iget-object v2, p0, Lcom/dtr/zxing/activity/CaptureActivity;->handler:Lcom/dtr/zxing/utils/CaptureActivityHandler;

    if-nez v2, :cond_2

    .line 189
    new-instance v2, Lcom/dtr/zxing/utils/CaptureActivityHandler;

    iget-object v3, p0, Lcom/dtr/zxing/activity/CaptureActivity;->cameraManager:Lcom/dtr/zxing/camera/CameraManager;

    .line 190
    const/16 v4, 0x200

    invoke-direct {v2, p0, v3, v4}, Lcom/dtr/zxing/utils/CaptureActivityHandler;-><init>(Lcom/dtr/zxing/activity/CaptureActivity;Lcom/dtr/zxing/camera/CameraManager;I)V

    .line 189
    iput-object v2, p0, Lcom/dtr/zxing/activity/CaptureActivity;->handler:Lcom/dtr/zxing/utils/CaptureActivityHandler;

    .line 192
    :cond_2
    invoke-direct {p0}, Lcom/dtr/zxing/activity/CaptureActivity;->initCrop()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 193
    :catch_0
    move-exception v1

    .line 194
    .local v1, "ioe":Ljava/io/IOException;
    invoke-static {p0}, Lcom/dtr/zxing/utils/ZXUtils;->displayFrameworkBugMessageAndExit(Landroid/app/Activity;)V

    goto :goto_0

    .line 195
    .end local v1    # "ioe":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 196
    .local v0, "e":Ljava/lang/RuntimeException;
    invoke-static {p0}, Lcom/dtr/zxing/utils/ZXUtils;->displayFrameworkBugMessageAndExit(Landroid/app/Activity;)V

    goto :goto_0
.end method

.method private initCrop()V
    .locals 19

    .prologue
    .line 216
    invoke-static/range {p0 .. p0}, Lcom/dtr/zxing/utils/ZXUtils;->isPortrait(Landroid/content/Context;)Z

    move-result v14

    if-eqz v14, :cond_0

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/dtr/zxing/activity/CaptureActivity;->cameraManager:Lcom/dtr/zxing/camera/CameraManager;

    invoke-virtual {v14}, Lcom/dtr/zxing/camera/CameraManager;->getCameraResolution()Landroid/graphics/Point;

    move-result-object v14

    iget v2, v14, Landroid/graphics/Point;->y:I

    .line 217
    .local v2, "cameraWidth":I
    :goto_0
    invoke-static/range {p0 .. p0}, Lcom/dtr/zxing/utils/ZXUtils;->isPortrait(Landroid/content/Context;)Z

    move-result v14

    if-eqz v14, :cond_1

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/dtr/zxing/activity/CaptureActivity;->cameraManager:Lcom/dtr/zxing/camera/CameraManager;

    invoke-virtual {v14}, Lcom/dtr/zxing/camera/CameraManager;->getCameraResolution()Landroid/graphics/Point;

    move-result-object v14

    iget v1, v14, Landroid/graphics/Point;->x:I

    .line 220
    .local v1, "cameraHeight":I
    :goto_1
    const/4 v14, 0x2

    new-array v10, v14, [I

    .line 221
    .local v10, "location":[I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/dtr/zxing/activity/CaptureActivity;->scanCropView:Landroid/widget/RelativeLayout;

    invoke-virtual {v14, v10}, Landroid/widget/RelativeLayout;->getLocationInWindow([I)V

    .line 223
    const/4 v14, 0x0

    aget v6, v10, v14

    .line 224
    .local v6, "cropLeft":I
    const/4 v14, 0x1

    aget v14, v10, v14

    invoke-direct/range {p0 .. p0}, Lcom/dtr/zxing/activity/CaptureActivity;->getStatusBarHeight()I

    move-result v15

    sub-int v7, v14, v15

    .line 226
    .local v7, "cropTop":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/dtr/zxing/activity/CaptureActivity;->scanCropView:Landroid/widget/RelativeLayout;

    invoke-virtual {v14}, Landroid/widget/RelativeLayout;->getWidth()I

    move-result v8

    .line 227
    .local v8, "cropWidth":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/dtr/zxing/activity/CaptureActivity;->scanCropView:Landroid/widget/RelativeLayout;

    invoke-virtual {v14}, Landroid/widget/RelativeLayout;->getHeight()I

    move-result v5

    .line 230
    .local v5, "cropHeight":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/dtr/zxing/activity/CaptureActivity;->scanContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {v14}, Landroid/widget/RelativeLayout;->getWidth()I

    move-result v4

    .line 231
    .local v4, "containerWidth":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/dtr/zxing/activity/CaptureActivity;->scanContainer:Landroid/widget/RelativeLayout;

    invoke-virtual {v14}, Landroid/widget/RelativeLayout;->getHeight()I

    move-result v3

    .line 234
    .local v3, "containerHeight":I
    mul-int v14, v6, v2

    div-int v12, v14, v4

    .line 236
    .local v12, "x":I
    mul-int v14, v7, v1

    div-int v13, v14, v3

    .line 239
    .local v13, "y":I
    mul-int v14, v8, v2

    div-int v11, v14, v4

    .line 241
    .local v11, "width":I
    mul-int v14, v5, v1

    div-int v9, v14, v3

    .line 244
    .local v9, "height":I
    invoke-static/range {p0 .. p0}, Lcom/dtr/zxing/utils/ZXUtils;->isPortrait(Landroid/content/Context;)Z

    move-result v14

    if-eqz v14, :cond_2

    .line 245
    new-instance v14, Landroid/graphics/Rect;

    add-int/lit8 v15, v13, -0xa

    add-int/lit8 v16, v12, -0xa

    add-int v17, v9, v13

    add-int/lit8 v17, v17, 0xa

    add-int v18, v11, v12

    add-int/lit8 v18, v18, 0xa

    invoke-direct/range {v14 .. v18}, Landroid/graphics/Rect;-><init>(IIII)V

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/dtr/zxing/activity/CaptureActivity;->mCropRect:Landroid/graphics/Rect;

    .line 249
    :goto_2
    return-void

    .line 216
    .end local v1    # "cameraHeight":I
    .end local v2    # "cameraWidth":I
    .end local v3    # "containerHeight":I
    .end local v4    # "containerWidth":I
    .end local v5    # "cropHeight":I
    .end local v6    # "cropLeft":I
    .end local v7    # "cropTop":I
    .end local v8    # "cropWidth":I
    .end local v9    # "height":I
    .end local v10    # "location":[I
    .end local v11    # "width":I
    .end local v12    # "x":I
    .end local v13    # "y":I
    :cond_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/dtr/zxing/activity/CaptureActivity;->cameraManager:Lcom/dtr/zxing/camera/CameraManager;

    invoke-virtual {v14}, Lcom/dtr/zxing/camera/CameraManager;->getCameraResolution()Landroid/graphics/Point;

    move-result-object v14

    iget v2, v14, Landroid/graphics/Point;->x:I

    goto :goto_0

    .line 217
    .restart local v2    # "cameraWidth":I
    :cond_1
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/dtr/zxing/activity/CaptureActivity;->cameraManager:Lcom/dtr/zxing/camera/CameraManager;

    invoke-virtual {v14}, Lcom/dtr/zxing/camera/CameraManager;->getCameraResolution()Landroid/graphics/Point;

    move-result-object v14

    iget v1, v14, Landroid/graphics/Point;->y:I

    goto :goto_1

    .line 247
    .restart local v1    # "cameraHeight":I
    .restart local v3    # "containerHeight":I
    .restart local v4    # "containerWidth":I
    .restart local v5    # "cropHeight":I
    .restart local v6    # "cropLeft":I
    .restart local v7    # "cropTop":I
    .restart local v8    # "cropWidth":I
    .restart local v9    # "height":I
    .restart local v10    # "location":[I
    .restart local v11    # "width":I
    .restart local v12    # "x":I
    .restart local v13    # "y":I
    :cond_2
    new-instance v14, Landroid/graphics/Rect;

    add-int/lit8 v15, v12, -0xa

    add-int/lit8 v16, v13, -0xa

    add-int v17, v11, v12

    add-int/lit8 v17, v17, 0xa

    add-int v18, v9, v13

    add-int/lit8 v18, v18, 0xa

    invoke-direct/range {v14 .. v18}, Landroid/graphics/Rect;-><init>(IIII)V

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/dtr/zxing/activity/CaptureActivity;->mCropRect:Landroid/graphics/Rect;

    goto :goto_2
.end method


# virtual methods
.method public getCameraManager()Lcom/dtr/zxing/camera/CameraManager;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/dtr/zxing/activity/CaptureActivity;->cameraManager:Lcom/dtr/zxing/camera/CameraManager;

    return-object v0
.end method

.method public getCropRect()Landroid/graphics/Rect;
    .locals 1

    .prologue
    .line 209
    iget-object v0, p0, Lcom/dtr/zxing/activity/CaptureActivity;->mCropRect:Landroid/graphics/Rect;

    return-object v0
.end method

.method public getHandler()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/dtr/zxing/activity/CaptureActivity;->handler:Lcom/dtr/zxing/utils/CaptureActivityHandler;

    return-object v0
.end method

.method public handleDecode(Lcom/google/zxing/Result;Landroid/os/Bundle;)V
    .locals 3
    .param p1, "rawResult"    # Lcom/google/zxing/Result;
    .param p2, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 298
    iget-object v1, p0, Lcom/dtr/zxing/activity/CaptureActivity;->inactivityTimer:Lcom/dtr/zxing/utils/InactivityTimer;

    invoke-virtual {v1}, Lcom/dtr/zxing/utils/InactivityTimer;->onActivity()V

    .line 299
    iget-object v1, p0, Lcom/dtr/zxing/activity/CaptureActivity;->beepManager:Lcom/dtr/zxing/utils/BeepManager;

    invoke-virtual {v1}, Lcom/dtr/zxing/utils/BeepManager;->playBeepSoundAndVibrate()V

    .line 300
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 301
    .local v0, "data":Landroid/content/Intent;
    const-string v1, "result"

    invoke-virtual {p1}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 302
    const/4 v1, -0x1

    invoke-virtual {p0, v1, v0}, Lcom/dtr/zxing/activity/CaptureActivity;->setResult(ILandroid/content/Intent;)V

    .line 303
    invoke-virtual {p0}, Lcom/dtr/zxing/activity/CaptureActivity;->finish()V

    .line 304
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .prologue
    .line 274
    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    .line 275
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/dtr/zxing/activity/CaptureActivity;->setResult(I)V

    .line 276
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 267
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 269
    sget v0, Lcom/dtr/zxing/R$id;->capture_container:I

    invoke-virtual {p0, v0}, Lcom/dtr/zxing/activity/CaptureActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 270
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 10
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x2

    .line 83
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 85
    invoke-virtual {p0}, Lcom/dtr/zxing/activity/CaptureActivity;->getWindow()Landroid/view/Window;

    move-result-object v9

    .line 86
    .local v9, "window":Landroid/view/Window;
    const/16 v3, 0x80

    invoke-virtual {v9, v3}, Landroid/view/Window;->addFlags(I)V

    .line 87
    sget v3, Lcom/dtr/zxing/R$layout;->activity_capture:I

    invoke-virtual {p0, v3}, Lcom/dtr/zxing/activity/CaptureActivity;->setContentView(I)V

    .line 89
    sget v3, Lcom/dtr/zxing/R$id;->capture_preview:I

    invoke-virtual {p0, v3}, Lcom/dtr/zxing/activity/CaptureActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/SurfaceView;

    iput-object v3, p0, Lcom/dtr/zxing/activity/CaptureActivity;->scanPreview:Landroid/view/SurfaceView;

    .line 90
    sget v3, Lcom/dtr/zxing/R$id;->capture_container:I

    invoke-virtual {p0, v3}, Lcom/dtr/zxing/activity/CaptureActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/RelativeLayout;

    iput-object v3, p0, Lcom/dtr/zxing/activity/CaptureActivity;->scanContainer:Landroid/widget/RelativeLayout;

    .line 91
    sget v3, Lcom/dtr/zxing/R$id;->capture_crop_view:I

    invoke-virtual {p0, v3}, Lcom/dtr/zxing/activity/CaptureActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/RelativeLayout;

    iput-object v3, p0, Lcom/dtr/zxing/activity/CaptureActivity;->scanCropView:Landroid/widget/RelativeLayout;

    .line 92
    sget v3, Lcom/dtr/zxing/R$id;->capture_scan_line:I

    invoke-virtual {p0, v3}, Lcom/dtr/zxing/activity/CaptureActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lcom/dtr/zxing/activity/CaptureActivity;->scanLine:Landroid/widget/ImageView;

    .line 94
    new-instance v3, Lcom/dtr/zxing/utils/InactivityTimer;

    invoke-direct {v3, p0}, Lcom/dtr/zxing/utils/InactivityTimer;-><init>(Landroid/app/Activity;)V

    iput-object v3, p0, Lcom/dtr/zxing/activity/CaptureActivity;->inactivityTimer:Lcom/dtr/zxing/utils/InactivityTimer;

    .line 95
    new-instance v3, Lcom/dtr/zxing/utils/BeepManager;

    invoke-direct {v3, p0}, Lcom/dtr/zxing/utils/BeepManager;-><init>(Landroid/app/Activity;)V

    iput-object v3, p0, Lcom/dtr/zxing/activity/CaptureActivity;->beepManager:Lcom/dtr/zxing/utils/BeepManager;

    .line 97
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    .line 101
    const v8, 0x3f666666    # 0.9f

    move v3, v1

    move v4, v2

    move v5, v1

    move v6, v2

    move v7, v1

    .line 97
    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    .line 103
    .local v0, "animation":Landroid/view/animation/TranslateAnimation;
    const-wide/16 v1, 0x1194

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/TranslateAnimation;->setDuration(J)V

    .line 104
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/TranslateAnimation;->setRepeatCount(I)V

    .line 105
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/TranslateAnimation;->setRepeatMode(I)V

    .line 106
    iget-object v1, p0, Lcom/dtr/zxing/activity/CaptureActivity;->scanLine:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 108
    sget v1, Lcom/dtr/zxing/R$id;->back:I

    invoke-virtual {p0, v1}, Lcom/dtr/zxing/activity/CaptureActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/dtr/zxing/activity/CaptureActivity;->button:Landroid/widget/Button;

    .line 109
    iget-object v1, p0, Lcom/dtr/zxing/activity/CaptureActivity;->button:Landroid/widget/Button;

    new-instance v2, Lcom/dtr/zxing/activity/CaptureActivity$1;

    invoke-direct {v2, p0}, Lcom/dtr/zxing/activity/CaptureActivity$1;-><init>(Lcom/dtr/zxing/activity/CaptureActivity;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 116
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 152
    iget-object v0, p0, Lcom/dtr/zxing/activity/CaptureActivity;->inactivityTimer:Lcom/dtr/zxing/utils/InactivityTimer;

    invoke-virtual {v0}, Lcom/dtr/zxing/utils/InactivityTimer;->shutdown()V

    .line 153
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 154
    return-void
.end method

.method public onGlobalLayout()V
    .locals 2

    .prologue
    .line 283
    :try_start_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-ge v0, v1, :cond_0

    .line 284
    sget v0, Lcom/dtr/zxing/R$id;->capture_container:I

    invoke-virtual {p0, v0}, Lcom/dtr/zxing/activity/CaptureActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 289
    :goto_0
    invoke-direct {p0}, Lcom/dtr/zxing/activity/CaptureActivity;->initCrop()V

    .line 290
    iget-object v0, p0, Lcom/dtr/zxing/activity/CaptureActivity;->cameraManager:Lcom/dtr/zxing/camera/CameraManager;

    invoke-virtual {v0}, Lcom/dtr/zxing/camera/CameraManager;->onConfigurationChanged()V

    .line 293
    :goto_1
    return-void

    .line 286
    :cond_0
    sget v0, Lcom/dtr/zxing/R$id;->capture_container:I

    invoke-virtual {p0, v0}, Lcom/dtr/zxing/activity/CaptureActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 291
    :catch_0
    move-exception v0

    goto :goto_1
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 137
    iget-object v0, p0, Lcom/dtr/zxing/activity/CaptureActivity;->handler:Lcom/dtr/zxing/utils/CaptureActivityHandler;

    if-eqz v0, :cond_0

    .line 138
    iget-object v0, p0, Lcom/dtr/zxing/activity/CaptureActivity;->handler:Lcom/dtr/zxing/utils/CaptureActivityHandler;

    invoke-virtual {v0}, Lcom/dtr/zxing/utils/CaptureActivityHandler;->quitSynchronously()V

    .line 139
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/dtr/zxing/activity/CaptureActivity;->handler:Lcom/dtr/zxing/utils/CaptureActivityHandler;

    .line 141
    :cond_0
    iget-object v0, p0, Lcom/dtr/zxing/activity/CaptureActivity;->inactivityTimer:Lcom/dtr/zxing/utils/InactivityTimer;

    invoke-virtual {v0}, Lcom/dtr/zxing/utils/InactivityTimer;->onPause()V

    .line 142
    iget-object v0, p0, Lcom/dtr/zxing/activity/CaptureActivity;->beepManager:Lcom/dtr/zxing/utils/BeepManager;

    invoke-virtual {v0}, Lcom/dtr/zxing/utils/BeepManager;->close()V

    .line 143
    iget-object v0, p0, Lcom/dtr/zxing/activity/CaptureActivity;->cameraManager:Lcom/dtr/zxing/camera/CameraManager;

    invoke-virtual {v0}, Lcom/dtr/zxing/camera/CameraManager;->closeDriver()V

    .line 144
    iget-boolean v0, p0, Lcom/dtr/zxing/activity/CaptureActivity;->isHasSurface:Z

    if-nez v0, :cond_1

    .line 145
    iget-object v0, p0, Lcom/dtr/zxing/activity/CaptureActivity;->scanPreview:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->removeCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 147
    :cond_1
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 148
    return-void
.end method

.method protected onResume()V
    .locals 2

    .prologue
    .line 120
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 122
    new-instance v0, Lcom/dtr/zxing/camera/CameraManager;

    invoke-virtual {p0}, Lcom/dtr/zxing/activity/CaptureActivity;->getApplication()Landroid/app/Application;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/dtr/zxing/camera/CameraManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/dtr/zxing/activity/CaptureActivity;->cameraManager:Lcom/dtr/zxing/camera/CameraManager;

    .line 124
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/dtr/zxing/activity/CaptureActivity;->handler:Lcom/dtr/zxing/utils/CaptureActivityHandler;

    .line 125
    iget-boolean v0, p0, Lcom/dtr/zxing/activity/CaptureActivity;->isHasSurface:Z

    if-eqz v0, :cond_0

    .line 126
    iget-object v0, p0, Lcom/dtr/zxing/activity/CaptureActivity;->scanPreview:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/dtr/zxing/activity/CaptureActivity;->initCamera(Landroid/view/SurfaceHolder;)V

    .line 132
    :goto_0
    iget-object v0, p0, Lcom/dtr/zxing/activity/CaptureActivity;->inactivityTimer:Lcom/dtr/zxing/utils/InactivityTimer;

    invoke-virtual {v0}, Lcom/dtr/zxing/utils/InactivityTimer;->onResume()V

    .line 133
    return-void

    .line 128
    :cond_0
    iget-object v0, p0, Lcom/dtr/zxing/activity/CaptureActivity;->scanPreview:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    const/4 v1, 0x3

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setType(I)V

    .line 129
    iget-object v0, p0, Lcom/dtr/zxing/activity/CaptureActivity;->scanPreview:Landroid/view/SurfaceView;

    invoke-virtual {v0}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    invoke-interface {v0, p0}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    goto :goto_0
.end method

.method public restartPreviewAfterDelay(J)V
    .locals 2
    .param p1, "delayMS"    # J

    .prologue
    .line 203
    iget-object v0, p0, Lcom/dtr/zxing/activity/CaptureActivity;->handler:Lcom/dtr/zxing/utils/CaptureActivityHandler;

    if-eqz v0, :cond_0

    .line 204
    iget-object v0, p0, Lcom/dtr/zxing/activity/CaptureActivity;->handler:Lcom/dtr/zxing/utils/CaptureActivityHandler;

    sget v1, Lcom/dtr/zxing/R$id;->restart_preview:I

    invoke-virtual {v0, v1, p1, p2}, Lcom/dtr/zxing/utils/CaptureActivityHandler;->sendEmptyMessageDelayed(IJ)Z

    .line 206
    :cond_0
    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0
    .param p1, "holder"    # Landroid/view/SurfaceHolder;
    .param p2, "format"    # I
    .param p3, "width"    # I
    .param p4, "height"    # I

    .prologue
    .line 176
    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 2
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 158
    if-nez p1, :cond_0

    .line 159
    sget-object v0, Lcom/dtr/zxing/activity/CaptureActivity;->TAG:Ljava/lang/String;

    .line 160
    const-string v1, "*** WARNING *** surfaceCreated() gave us a null surface!"

    .line 159
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    :cond_0
    iget-boolean v0, p0, Lcom/dtr/zxing/activity/CaptureActivity;->isHasSurface:Z

    if-nez v0, :cond_1

    .line 163
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/dtr/zxing/activity/CaptureActivity;->isHasSurface:Z

    .line 164
    invoke-direct {p0, p1}, Lcom/dtr/zxing/activity/CaptureActivity;->initCamera(Landroid/view/SurfaceHolder;)V

    .line 166
    :cond_1
    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 1
    .param p1, "holder"    # Landroid/view/SurfaceHolder;

    .prologue
    .line 170
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/dtr/zxing/activity/CaptureActivity;->isHasSurface:Z

    .line 171
    return-void
.end method
