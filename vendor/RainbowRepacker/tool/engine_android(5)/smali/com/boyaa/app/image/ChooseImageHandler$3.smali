.class Lcom/boyaa/app/image/ChooseImageHandler$3;
.super Ljava/lang/Object;
.source "ChooseImageHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/app/image/ChooseImageHandler;->onSaveBitmap(Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/app/image/ChooseImageHandler;

.field private final synthetic val$strDicName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/app/image/ChooseImageHandler;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/app/image/ChooseImageHandler$3;->this$0:Lcom/boyaa/app/image/ChooseImageHandler;

    iput-object p2, p0, Lcom/boyaa/app/image/ChooseImageHandler$3;->val$strDicName:Ljava/lang/String;

    .line 425
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 428
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v0

    iget-object v1, p0, Lcom/boyaa/app/image/ChooseImageHandler$3;->val$strDicName:Ljava/lang/String;

    .line 429
    const/4 v2, 0x0

    .line 428
    invoke-virtual {v0, v1, v2}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 430
    return-void
.end method
