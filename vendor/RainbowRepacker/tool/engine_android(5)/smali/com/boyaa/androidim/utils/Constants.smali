.class public Lcom/boyaa/androidim/utils/Constants;
.super Ljava/lang/Object;
.source "Constants.java"


# static fields
.field public static final DIR_VOICE_CHAT_TEMP:Ljava/lang/String; = "/data/voice_chat_temp"

.field public static IM_PATH:Ljava/lang/String; = null

.field public static final IM_PATH_NAME:Ljava/lang/String; = "/im"

.field public static final PLAY_FININ:I = 0x1

.field public static final RECORD_FININ:I = 0x2

.field public static stopPlay:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 6
    const/4 v0, 0x0

    sput-boolean v0, Lcom/boyaa/androidim/utils/Constants;->stopPlay:Z

    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "/im"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/boyaa/androidim/utils/Constants;->IM_PATH:Ljava/lang/String;

    .line 5
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
