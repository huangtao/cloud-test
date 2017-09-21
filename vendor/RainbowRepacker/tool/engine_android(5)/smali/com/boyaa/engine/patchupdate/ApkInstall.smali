.class public Lcom/boyaa/engine/patchupdate/ApkInstall;
.super Ljava/lang/Object;
.source "ApkInstall.java"


# static fields
.field private static final KEventResponse:Ljava/lang/String; = "event_install_apk"

.field private static final kResult:Ljava/lang/String; = "result"

.field private static final kResultError:I = -0x1

.field private static final kResultSuccess:I = 0x1

.field private static final kstrDictName:Ljava/lang/String; = "patchUpdate"


# instance fields
.field private result:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/boyaa/engine/patchupdate/ApkInstall;)I
    .locals 1
    .param p0, "x0"    # Lcom/boyaa/engine/patchupdate/ApkInstall;

    .prologue
    .line 20
    iget v0, p0, Lcom/boyaa/engine/patchupdate/ApkInstall;->result:I

    return v0
.end method


# virtual methods
.method public startInstall(Ljava/lang/String;)V
    .locals 4
    .param p1, "apkFullPath"    # Ljava/lang/String;

    .prologue
    .line 34
    const/4 v2, 0x1

    iput v2, p0, Lcom/boyaa/engine/patchupdate/ApkInstall;->result:I

    .line 35
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 36
    .local v0, "apkFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 37
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 38
    .local v1, "intent":Landroid/content/Intent;
    const/high16 v2, 0x10000000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 39
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "file://"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    const-string v3, "application/vnd.android.package-archive"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 40
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->getInstance()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/boyaa/engine/made/AppActivity;->startActivity(Landroid/content/Intent;)V

    .line 45
    .end local v1    # "intent":Landroid/content/Intent;
    :goto_0
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->getInstance()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v2

    new-instance v3, Lcom/boyaa/engine/patchupdate/ApkInstall$1;

    invoke-direct {v3, p0}, Lcom/boyaa/engine/patchupdate/ApkInstall$1;-><init>(Lcom/boyaa/engine/patchupdate/ApkInstall;)V

    invoke-virtual {v2, v3}, Lcom/boyaa/engine/made/AppActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 53
    return-void

    .line 42
    :cond_0
    const/4 v2, -0x1

    iput v2, p0, Lcom/boyaa/engine/patchupdate/ApkInstall;->result:I

    goto :goto_0
.end method
