.class Lcom/boyaa/app/image/UploadFeedbackImage$1$2;
.super Ljava/lang/Object;
.source "UploadFeedbackImage.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/app/image/UploadFeedbackImage$1;->onUIBackPressed()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/boyaa/app/image/UploadFeedbackImage$1;


# direct methods
.method constructor <init>(Lcom/boyaa/app/image/UploadFeedbackImage$1;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/app/image/UploadFeedbackImage$1$2;->this$1:Lcom/boyaa/app/image/UploadFeedbackImage$1;

    .line 259
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 262
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v0

    iget-object v1, p0, Lcom/boyaa/app/image/UploadFeedbackImage$1$2;->this$1:Lcom/boyaa/app/image/UploadFeedbackImage$1;

    # getter for: Lcom/boyaa/app/image/UploadFeedbackImage$1;->this$0:Lcom/boyaa/app/image/UploadFeedbackImage;
    invoke-static {v1}, Lcom/boyaa/app/image/UploadFeedbackImage$1;->access$0(Lcom/boyaa/app/image/UploadFeedbackImage$1;)Lcom/boyaa/app/image/UploadFeedbackImage;

    move-result-object v1

    # getter for: Lcom/boyaa/app/image/UploadFeedbackImage;->strDicName:Ljava/lang/String;
    invoke-static {v1}, Lcom/boyaa/app/image/UploadFeedbackImage;->access$0(Lcom/boyaa/app/image/UploadFeedbackImage;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 263
    return-void
.end method
