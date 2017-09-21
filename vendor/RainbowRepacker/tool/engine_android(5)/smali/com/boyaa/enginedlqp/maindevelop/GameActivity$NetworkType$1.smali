.class Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType$1;
.super Landroid/content/BroadcastReceiver;
.source "GameActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType;


# direct methods
.method constructor <init>(Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType$1;->this$1:Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType;

    .line 503
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 506
    const-string v4, "networkInfo"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/net/NetworkInfo;

    .line 507
    .local v1, "info":Landroid/net/NetworkInfo;
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v3

    .line 508
    .local v3, "typeName":Ljava/lang/String;
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getSubtypeName()Ljava/lang/String;

    move-result-object v2

    .line 509
    .local v2, "subTypeName":Ljava/lang/String;
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getExtraInfo()Ljava/lang/String;

    move-result-object v0

    .line 510
    .local v0, "extraInfo":Ljava/lang/String;
    sget-object v4, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    new-instance v5, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType$1$1;

    invoke-direct {v5, p0, v3, v2, v0}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType$1$1;-><init>(Lcom/boyaa/enginedlqp/maindevelop/GameActivity$NetworkType$1;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Lcom/boyaa/enginedlqp/maindevelop/GameActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 531
    return-void
.end method
