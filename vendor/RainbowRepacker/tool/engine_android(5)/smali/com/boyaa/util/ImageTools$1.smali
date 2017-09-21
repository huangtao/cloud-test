.class Lcom/boyaa/util/ImageTools$1;
.super Ljava/lang/Thread;
.source "ImageTools.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/util/ImageTools;->savePhotoToSDCardAsync(Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$path:Ljava/lang/String;

.field private final synthetic val$photoBitmap:Landroid/graphics/Bitmap;

.field private final synthetic val$photoName:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/util/ImageTools$1;->val$photoBitmap:Landroid/graphics/Bitmap;

    iput-object p2, p0, Lcom/boyaa/util/ImageTools$1;->val$path:Ljava/lang/String;

    iput-object p3, p0, Lcom/boyaa/util/ImageTools$1;->val$photoName:Ljava/lang/String;

    .line 25
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 27
    iget-object v3, p0, Lcom/boyaa/util/ImageTools$1;->val$photoBitmap:Landroid/graphics/Bitmap;

    .line 28
    iget-object v4, p0, Lcom/boyaa/util/ImageTools$1;->val$path:Ljava/lang/String;

    .line 29
    iget-object v5, p0, Lcom/boyaa/util/ImageTools$1;->val$photoName:Ljava/lang/String;

    .line 27
    invoke-static {v3, v4, v5}, Lcom/boyaa/util/ImageTools;->savePhotoToSDCard(Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 32
    .local v1, "filePath":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_0

    .line 33
    sget-object v3, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    invoke-static {v1, v3}, Lcom/boyaa/util/ImageTools;->scanPhotos(Ljava/lang/String;Landroid/content/Context;)V

    .line 35
    :cond_0
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v2

    .line 36
    .local v2, "msg":Landroid/os/Message;
    const/16 v3, 0x4fe

    iput v3, v2, Landroid/os/Message;->what:I

    .line 37
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 38
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v3, "isSuccess"

    const/4 v4, 0x1

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 39
    const-string v3, "path"

    iget-object v4, p0, Lcom/boyaa/util/ImageTools$1;->val$path:Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    const-string v3, "photoName"

    iget-object v4, p0, Lcom/boyaa/util/ImageTools$1;->val$photoName:Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    invoke-virtual {v2, v0}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 42
    invoke-static {}, Lcom/boyaa/enginedlqp/maindevelop/Game;->getGameHandler()Landroid/os/Handler;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 43
    return-void
.end method
