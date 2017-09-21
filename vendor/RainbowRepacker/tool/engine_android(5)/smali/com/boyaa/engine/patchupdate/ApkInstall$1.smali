.class Lcom/boyaa/engine/patchupdate/ApkInstall$1;
.super Ljava/lang/Object;
.source "ApkInstall.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/boyaa/engine/patchupdate/ApkInstall;->startInstall(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/boyaa/engine/patchupdate/ApkInstall;


# direct methods
.method constructor <init>(Lcom/boyaa/engine/patchupdate/ApkInstall;)V
    .locals 0

    .prologue
    .line 46
    iput-object p1, p0, Lcom/boyaa/engine/patchupdate/ApkInstall$1;->this$0:Lcom/boyaa/engine/patchupdate/ApkInstall;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 49
    const-string v0, "patchUpdate"

    const-string v1, "result"

    iget-object v2, p0, Lcom/boyaa/engine/patchupdate/ApkInstall$1;->this$0:Lcom/boyaa/engine/patchupdate/ApkInstall;

    # getter for: Lcom/boyaa/engine/patchupdate/ApkInstall;->result:I
    invoke-static {v2}, Lcom/boyaa/engine/patchupdate/ApkInstall;->access$000(Lcom/boyaa/engine/patchupdate/ApkInstall;)I

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/Dict;->setInt(Ljava/lang/String;Ljava/lang/String;I)I

    .line 50
    const-string v0, "event_install_apk"

    invoke-static {v0}, Lcom/boyaa/engine/made/Sys;->callLua(Ljava/lang/String;)I

    .line 51
    return-void
.end method
