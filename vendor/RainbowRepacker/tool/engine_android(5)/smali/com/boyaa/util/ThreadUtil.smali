.class public Lcom/boyaa/util/ThreadUtil;
.super Ljava/lang/Object;
.source "ThreadUtil.java"


# instance fields
.field public context:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/boyaa/util/ThreadUtil;->context:Landroid/content/Context;

    .line 26
    return-void
.end method


# virtual methods
.method public doPreloadSound(Ljava/lang/String;)V
    .locals 4
    .param p1, "soundPath"    # Ljava/lang/String;

    .prologue
    .line 32
    sget-object v0, Lcom/boyaa/enginedlqp/maindevelop/Game;->mActivity:Lcom/boyaa/enginedlqp/maindevelop/GameActivity;

    const-string v1, ""

    const/4 v2, 0x0

    new-instance v3, Lcom/boyaa/util/ThreadUtil$1;

    invoke-direct {v3, p0, p1}, Lcom/boyaa/util/ThreadUtil$1;-><init>(Lcom/boyaa/util/ThreadUtil;Ljava/lang/String;)V

    invoke-static {v0, v1, v2, v3}, Lcom/boyaa/app/common/ThreadTask;->start(Landroid/app/Activity;Ljava/lang/String;ZLcom/boyaa/app/common/OnThreadTask;)V

    .line 80
    return-void
.end method
