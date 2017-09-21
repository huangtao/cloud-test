.class Lcom/boyaa/app/WebHanlder$3$1;
.super Ljava/lang/Object;
.source "WebHanlder.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/app/WebHanlder$3;->onCallBack(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/boyaa/app/WebHanlder$3;

.field private final synthetic val$cbFuncName:Ljava/lang/String;

.field private final synthetic val$string:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/boyaa/app/WebHanlder$3;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/app/WebHanlder$3$1;->this$1:Lcom/boyaa/app/WebHanlder$3;

    iput-object p2, p0, Lcom/boyaa/app/WebHanlder$3$1;->val$cbFuncName:Ljava/lang/String;

    iput-object p3, p0, Lcom/boyaa/app/WebHanlder$3$1;->val$string:Ljava/lang/String;

    .line 244
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 249
    iget-object v0, p0, Lcom/boyaa/app/WebHanlder$3$1;->this$1:Lcom/boyaa/app/WebHanlder$3;

    # getter for: Lcom/boyaa/app/WebHanlder$3;->this$0:Lcom/boyaa/app/WebHanlder;
    invoke-static {v0}, Lcom/boyaa/app/WebHanlder$3;->access$0(Lcom/boyaa/app/WebHanlder$3;)Lcom/boyaa/app/WebHanlder;

    move-result-object v0

    iget-object v1, p0, Lcom/boyaa/app/WebHanlder$3$1;->val$cbFuncName:Ljava/lang/String;

    iget-object v2, p0, Lcom/boyaa/app/WebHanlder$3$1;->val$string:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/boyaa/app/WebHanlder;->doJsFuction(Ljava/lang/String;Ljava/lang/String;)V

    .line 250
    return-void
.end method
