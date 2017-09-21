.class Lcom/boyaa/downloader/util/AppCheckHelper$1;
.super Ljava/lang/Object;
.source "AppCheckHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/downloader/util/AppCheckHelper;->getAppInfo(Landroid/content/Context;Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$util:Lcom/boyaa/util/JsonUtil;


# direct methods
.method constructor <init>(Lcom/boyaa/util/JsonUtil;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/boyaa/downloader/util/AppCheckHelper$1;->val$util:Lcom/boyaa/util/JsonUtil;

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 65
    invoke-static {}, Lcom/boyaa/app/core/HandlerManager;->getHandlerManager()Lcom/boyaa/app/core/HandlerManager;

    move-result-object v0

    const-string v1, "getInstalledAppInfo"

    iget-object v2, p0, Lcom/boyaa/downloader/util/AppCheckHelper$1;->val$util:Lcom/boyaa/util/JsonUtil;

    invoke-virtual {v2}, Lcom/boyaa/util/JsonUtil;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/boyaa/app/core/HandlerManager;->luaCallEvent(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    return-void
.end method
