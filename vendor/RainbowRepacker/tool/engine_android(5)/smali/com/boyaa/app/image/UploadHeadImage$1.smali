.class Lcom/boyaa/app/image/UploadHeadImage$1;
.super Lcom/boyaa/app/common/OnThreadTask;
.source "UploadHeadImage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/app/image/UploadHeadImage;->uploadPhoto(Lcom/boyaa/enginedlqp/maindevelop/Game;Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field result:Lcom/boyaa/app/php/PHPResult;

.field private final synthetic val$activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

.field private final synthetic val$filePath:Ljava/lang/String;

.field private final synthetic val$imageName:Ljava/lang/String;

.field private final synthetic val$paramMap:Ljava/util/Map;

.field private final synthetic val$strDicName:Ljava/lang/String;

.field private final synthetic val$uri:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;Lcom/boyaa/enginedlqp/maindevelop/Game;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/app/image/UploadHeadImage$1;->val$filePath:Ljava/lang/String;

    iput-object p2, p0, Lcom/boyaa/app/image/UploadHeadImage$1;->val$paramMap:Ljava/util/Map;

    iput-object p3, p0, Lcom/boyaa/app/image/UploadHeadImage$1;->val$uri:Ljava/lang/String;

    iput-object p4, p0, Lcom/boyaa/app/image/UploadHeadImage$1;->val$activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

    iput-object p5, p0, Lcom/boyaa/app/image/UploadHeadImage$1;->val$imageName:Ljava/lang/String;

    iput-object p6, p0, Lcom/boyaa/app/image/UploadHeadImage$1;->val$strDicName:Ljava/lang/String;

    .line 240
    invoke-direct {p0}, Lcom/boyaa/app/common/OnThreadTask;-><init>()V

    .line 241
    new-instance v0, Lcom/boyaa/app/php/PHPResult;

    invoke-direct {v0}, Lcom/boyaa/app/php/PHPResult;-><init>()V

    iput-object v0, p0, Lcom/boyaa/app/image/UploadHeadImage$1;->result:Lcom/boyaa/app/php/PHPResult;

    return-void
.end method


# virtual methods
.method public onAfterUIRun()V
    .locals 4

    .prologue
    .line 253
    iget-object v0, p0, Lcom/boyaa/app/image/UploadHeadImage$1;->val$activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

    new-instance v1, Lcom/boyaa/app/image/UploadHeadImage$1$1;

    iget-object v2, p0, Lcom/boyaa/app/image/UploadHeadImage$1;->val$imageName:Ljava/lang/String;

    iget-object v3, p0, Lcom/boyaa/app/image/UploadHeadImage$1;->val$strDicName:Ljava/lang/String;

    invoke-direct {v1, p0, v2, v3}, Lcom/boyaa/app/image/UploadHeadImage$1$1;-><init>(Lcom/boyaa/app/image/UploadHeadImage$1;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/Game;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 269
    return-void
.end method

.method public onThreadRun()V
    .locals 4

    .prologue
    .line 247
    iget-object v0, p0, Lcom/boyaa/app/image/UploadHeadImage$1;->val$filePath:Ljava/lang/String;

    iget-object v1, p0, Lcom/boyaa/app/image/UploadHeadImage$1;->val$paramMap:Ljava/util/Map;

    iget-object v2, p0, Lcom/boyaa/app/image/UploadHeadImage$1;->result:Lcom/boyaa/app/php/PHPResult;

    iget-object v3, p0, Lcom/boyaa/app/image/UploadHeadImage$1;->val$uri:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3}, Lcom/boyaa/app/image/UploadHeadImage;->uploadVisitorIcon(Ljava/lang/String;Ljava/util/Map;Lcom/boyaa/app/php/PHPResult;Ljava/lang/String;)Z

    .line 248
    return-void
.end method

.method public onUIBackPressed()V
    .locals 3

    .prologue
    .line 273
    iget-object v0, p0, Lcom/boyaa/app/image/UploadHeadImage$1;->val$activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

    new-instance v1, Lcom/boyaa/app/image/UploadHeadImage$1$2;

    iget-object v2, p0, Lcom/boyaa/app/image/UploadHeadImage$1;->val$strDicName:Ljava/lang/String;

    invoke-direct {v1, p0, v2}, Lcom/boyaa/app/image/UploadHeadImage$1$2;-><init>(Lcom/boyaa/app/image/UploadHeadImage$1;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/Game;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 279
    return-void
.end method
