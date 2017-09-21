.class Lcom/boyaa/app/image/UploadFeedbackImage$1;
.super Lcom/boyaa/app/common/OnThreadTask;
.source "UploadFeedbackImage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/app/image/UploadFeedbackImage;->doUploadPhotoAction()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field result:Lcom/boyaa/app/php/PHPResult;

.field final synthetic this$0:Lcom/boyaa/app/image/UploadFeedbackImage;

.field private final synthetic val$filePath:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/app/image/UploadFeedbackImage;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/app/image/UploadFeedbackImage$1;->this$0:Lcom/boyaa/app/image/UploadFeedbackImage;

    iput-object p2, p0, Lcom/boyaa/app/image/UploadFeedbackImage$1;->val$filePath:Ljava/lang/String;

    .line 220
    invoke-direct {p0}, Lcom/boyaa/app/common/OnThreadTask;-><init>()V

    .line 221
    new-instance v0, Lcom/boyaa/app/php/PHPResult;

    invoke-direct {v0}, Lcom/boyaa/app/php/PHPResult;-><init>()V

    iput-object v0, p0, Lcom/boyaa/app/image/UploadFeedbackImage$1;->result:Lcom/boyaa/app/php/PHPResult;

    return-void
.end method

.method static synthetic access$0(Lcom/boyaa/app/image/UploadFeedbackImage$1;)Lcom/boyaa/app/image/UploadFeedbackImage;
    .locals 1

    .prologue
    .line 220
    iget-object v0, p0, Lcom/boyaa/app/image/UploadFeedbackImage$1;->this$0:Lcom/boyaa/app/image/UploadFeedbackImage;

    return-object v0
.end method


# virtual methods
.method public onAfterUIRun()V
    .locals 2

    .prologue
    .line 230
    iget-object v0, p0, Lcom/boyaa/app/image/UploadFeedbackImage$1;->this$0:Lcom/boyaa/app/image/UploadFeedbackImage;

    iget-object v0, v0, Lcom/boyaa/app/image/UploadFeedbackImage;->activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

    new-instance v1, Lcom/boyaa/app/image/UploadFeedbackImage$1$1;

    invoke-direct {v1, p0}, Lcom/boyaa/app/image/UploadFeedbackImage$1$1;-><init>(Lcom/boyaa/app/image/UploadFeedbackImage$1;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/Game;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 255
    return-void
.end method

.method public onThreadRun()V
    .locals 4

    .prologue
    .line 224
    iget-object v0, p0, Lcom/boyaa/app/image/UploadFeedbackImage$1;->val$filePath:Ljava/lang/String;

    .line 225
    const-string v1, "https://feedback.boyaagame.com/api/api.php"

    iget-object v2, p0, Lcom/boyaa/app/image/UploadFeedbackImage$1;->this$0:Lcom/boyaa/app/image/UploadFeedbackImage;

    iget-object v2, v2, Lcom/boyaa/app/image/UploadFeedbackImage;->paramMap:Ljava/util/HashMap;

    iget-object v3, p0, Lcom/boyaa/app/image/UploadFeedbackImage$1;->result:Lcom/boyaa/app/php/PHPResult;

    .line 224
    invoke-static {v0, v1, v2, v3}, Lcom/boyaa/app/image/UploadFeedbackImage;->uploadFeedbackImage(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Lcom/boyaa/app/php/PHPResult;)Z

    .line 226
    return-void
.end method

.method public onUIBackPressed()V
    .locals 2

    .prologue
    .line 259
    iget-object v0, p0, Lcom/boyaa/app/image/UploadFeedbackImage$1;->this$0:Lcom/boyaa/app/image/UploadFeedbackImage;

    iget-object v0, v0, Lcom/boyaa/app/image/UploadFeedbackImage;->activity:Lcom/boyaa/enginedlqp/maindevelop/Game;

    new-instance v1, Lcom/boyaa/app/image/UploadFeedbackImage$1$2;

    invoke-direct {v1, p0}, Lcom/boyaa/app/image/UploadFeedbackImage$1$2;-><init>(Lcom/boyaa/app/image/UploadFeedbackImage$1;)V

    invoke-virtual {v0, v1}, Lcom/boyaa/enginedlqp/maindevelop/Game;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 265
    return-void
.end method
