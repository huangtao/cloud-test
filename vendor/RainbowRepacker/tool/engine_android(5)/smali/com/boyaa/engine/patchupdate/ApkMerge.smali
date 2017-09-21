.class public Lcom/boyaa/engine/patchupdate/ApkMerge;
.super Ljava/lang/Object;
.source "ApkMerge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/boyaa/engine/patchupdate/ApkMerge$MD5Util;
    }
.end annotation


# static fields
.field private static final KEventResponse:Ljava/lang/String; = "event_merge_new_apk"

.field private static final kCode:I = 0x0

.field private static final kIsVerifyMD5:Ljava/lang/String; = "isVerifyMD5"

.field private static final kResult:Ljava/lang/String; = "result"

.field private static final kResultError:I = -0x1

.field private static final kResultSuccess:I = 0x1

.field private static final knewApkMD5:Ljava/lang/String; = "newApkMD5"

.field private static final knewApkPath:Ljava/lang/String; = "newApkPath"

.field private static final kpatchMD5:Ljava/lang/String; = "patchMD5"

.field private static final kpatchPath:Ljava/lang/String; = "patchPath"

.field private static final kstrDictName:Ljava/lang/String; = "patchUpdate"


# instance fields
.field private isVerifyMD5:I

.field private newApkMD5:Ljava/lang/String;

.field private newApkPath:Ljava/lang/String;

.field private patchMD5:Ljava/lang/String;

.field private patchPath:Ljava/lang/String;

.field private result:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 163
    return-void
.end method

.method static synthetic access$000(Lcom/boyaa/engine/patchupdate/ApkMerge;)I
    .locals 1
    .param p0, "x0"    # Lcom/boyaa/engine/patchupdate/ApkMerge;

    .prologue
    .line 29
    iget v0, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->result:I

    return v0
.end method

.method private chmod(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "permission"    # Ljava/lang/String;
    .param p2, "path"    # Ljava/lang/String;

    .prologue
    .line 153
    :try_start_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "chmod "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 154
    .local v0, "command":Ljava/lang/String;
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v1

    .line 155
    .local v1, "runtime":Ljava/lang/Runtime;
    invoke-virtual {v1, v0}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 158
    .end local v0    # "command":Ljava/lang/String;
    .end local v1    # "runtime":Ljava/lang/Runtime;
    :goto_0
    return-void

    .line 156
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method private isVerifyMD5()Z
    .locals 1

    .prologue
    .line 140
    iget v0, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->isVerifyMD5:I

    if-nez v0, :cond_0

    .line 141
    const/4 v0, 0x0

    .line 143
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public Execute()V
    .locals 3

    .prologue
    .line 54
    invoke-static {}, Lcom/boyaa/engine/patchupdate/PatchUpdate;->load()V

    .line 55
    const-string v0, "patchUpdate"

    const-string v1, "patchPath"

    invoke-static {v0, v1}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->patchPath:Ljava/lang/String;

    .line 56
    const-string v0, "patchUpdate"

    const-string v1, "newApkPath"

    invoke-static {v0, v1}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->newApkPath:Ljava/lang/String;

    .line 57
    const-string v0, "patchUpdate"

    const-string v1, "patchMD5"

    invoke-static {v0, v1}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->patchMD5:Ljava/lang/String;

    .line 58
    const-string v0, "patchUpdate"

    const-string v1, "newApkMD5"

    invoke-static {v0, v1}, Lcom/boyaa/engine/made/Dict;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->newApkMD5:Ljava/lang/String;

    .line 59
    const-string v0, "patchUpdate"

    const-string v1, "isVerifyMD5"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/boyaa/engine/made/Dict;->getInt(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->isVerifyMD5:I

    .line 60
    new-instance v0, Ljava/lang/Thread;

    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 61
    return-void
.end method

.method public run()V
    .locals 9

    .prologue
    const/4 v8, 0x1

    const/4 v7, -0x1

    .line 69
    iput v8, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->result:I

    .line 70
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->getInstance()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/boyaa/engine/made/AppActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getPackageResourcePath()Ljava/lang/String;

    move-result-object v4

    .line 75
    .local v4, "sourceApkDir":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    iget-object v5, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->newApkPath:Ljava/lang/String;

    invoke-direct {v1, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 76
    .local v1, "lastApk":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 78
    invoke-direct {p0}, Lcom/boyaa/engine/patchupdate/ApkMerge;->isVerifyMD5()Z

    move-result v5

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->newApkPath:Ljava/lang/String;

    iget-object v6, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->newApkMD5:Ljava/lang/String;

    invoke-static {v5, v6}, Lcom/boyaa/engine/patchupdate/ApkMerge$MD5Util;->verify(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 80
    iput v8, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->result:I

    .line 81
    const-string v5, "777"

    iget-object v6, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->newApkPath:Ljava/lang/String;

    invoke-direct {p0, v5, v6}, Lcom/boyaa/engine/patchupdate/ApkMerge;->chmod(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    :goto_0
    invoke-static {}, Lcom/boyaa/engine/made/AppActivity;->getInstance()Lcom/boyaa/engine/made/AppActivity;

    move-result-object v5

    new-instance v6, Lcom/boyaa/engine/patchupdate/ApkMerge$1;

    invoke-direct {v6, p0}, Lcom/boyaa/engine/patchupdate/ApkMerge$1;-><init>(Lcom/boyaa/engine/patchupdate/ApkMerge;)V

    invoke-virtual {v5, v6}, Lcom/boyaa/engine/made/AppActivity;->runOnLuaThread(Ljava/lang/Runnable;)V

    .line 133
    return-void

    .line 85
    :cond_0
    const/4 v1, 0x0

    .line 88
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 89
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_1

    .line 90
    iput v7, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->result:I

    goto :goto_0

    .line 93
    :cond_1
    new-instance v3, Ljava/io/File;

    iget-object v5, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->patchPath:Ljava/lang/String;

    invoke-direct {v3, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 94
    .local v3, "patchFile":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_2

    .line 95
    iput v7, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->result:I

    goto :goto_0

    .line 100
    :cond_2
    iget-object v5, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->newApkPath:Ljava/lang/String;

    iget-object v6, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->patchPath:Ljava/lang/String;

    invoke-static {v4, v5, v6}, Lcom/boyaa/engine/patchupdate/PatchUpdate;->bspatchUpdate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->result:I

    .line 101
    iget v5, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->result:I

    if-eqz v5, :cond_3

    .line 102
    iput v7, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->result:I

    goto :goto_0

    .line 105
    :cond_3
    iput v8, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->result:I

    .line 108
    new-instance v2, Ljava/io/File;

    iget-object v5, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->newApkPath:Ljava/lang/String;

    invoke-direct {v2, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 109
    .local v2, "newApkFile":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_4

    .line 110
    iput v7, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->result:I

    goto :goto_0

    .line 115
    :cond_4
    invoke-direct {p0}, Lcom/boyaa/engine/patchupdate/ApkMerge;->isVerifyMD5()Z

    move-result v5

    if-eqz v5, :cond_6

    iget-object v5, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->patchPath:Ljava/lang/String;

    iget-object v6, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->patchMD5:Ljava/lang/String;

    invoke-static {v5, v6}, Lcom/boyaa/engine/patchupdate/ApkMerge$MD5Util;->verify(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    iget-object v5, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->newApkPath:Ljava/lang/String;

    iget-object v6, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->newApkMD5:Ljava/lang/String;

    invoke-static {v5, v6}, Lcom/boyaa/engine/patchupdate/ApkMerge$MD5Util;->verify(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_6

    .line 117
    :cond_5
    iput v7, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->result:I

    goto :goto_0

    .line 121
    :cond_6
    const-string v5, "777"

    iget-object v6, p0, Lcom/boyaa/engine/patchupdate/ApkMerge;->newApkPath:Ljava/lang/String;

    invoke-direct {p0, v5, v6}, Lcom/boyaa/engine/patchupdate/ApkMerge;->chmod(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
