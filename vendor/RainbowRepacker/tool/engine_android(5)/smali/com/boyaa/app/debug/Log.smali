.class public Lcom/boyaa/app/debug/Log;
.super Ljava/lang/Object;
.source "Log.java"


# static fields
.field private static final DEBUG:I = 0x2

.field private static final ERROR:I = 0x10

.field public static final ERROR_TAG:Ljava/lang/String; = "ERROR"

.field private static final INFO:I = 0x4

.field private static LEVEL:I = 0x0

.field private static LOG_SWITCH:Z = false

.field private static final RELEASE:I = 0x0

.field private static final VERBOSE:I = 0x1

.field private static final WARN:I = 0x8


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 17
    sput v0, Lcom/boyaa/app/debug/Log;->LEVEL:I

    .line 19
    sput-boolean v0, Lcom/boyaa/app/debug/Log;->LOG_SWITCH:Z

    .line 22
    sget-boolean v0, Lcom/boyaa/app/BoyaaApplication;->isDebug:Z

    if-eqz v0, :cond_0

    const/16 v0, 0x1f

    sput v0, Lcom/boyaa/app/debug/Log;->LEVEL:I

    .line 23
    :cond_0
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "log"    # Ljava/lang/String;

    .prologue
    .line 26
    const/4 v0, 0x2

    invoke-static {v0}, Lcom/boyaa/app/debug/Log;->permission(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 27
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    :cond_0
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "log"    # Ljava/lang/String;

    .prologue
    .line 44
    const/16 v0, 0x10

    invoke-static {v0}, Lcom/boyaa/app/debug/Log;->permission(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 45
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    :cond_0
    return-void
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "log"    # Ljava/lang/String;

    .prologue
    .line 32
    const/4 v0, 0x4

    invoke-static {v0}, Lcom/boyaa/app/debug/Log;->permission(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 33
    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    :cond_0
    return-void
.end method

.method private static permission(I)Z
    .locals 1
    .param p0, "level"    # I

    .prologue
    .line 60
    sget v0, Lcom/boyaa/app/debug/Log;->LEVEL:I

    and-int/2addr v0, p0

    if-gtz v0, :cond_0

    sget-boolean v0, Lcom/boyaa/app/debug/Log;->LOG_SWITCH:Z

    if-eqz v0, :cond_1

    .line 61
    :cond_0
    const/4 v0, 0x1

    .line 63
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static setLogSwitch(Z)V
    .locals 0
    .param p0, "logSwitch"    # Z

    .prologue
    .line 56
    sput-boolean p0, Lcom/boyaa/app/debug/Log;->LOG_SWITCH:Z

    .line 57
    return-void
.end method

.method public static v(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "log"    # Ljava/lang/String;

    .prologue
    .line 50
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/boyaa/app/debug/Log;->permission(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 51
    invoke-static {p0, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    :cond_0
    return-void
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "log"    # Ljava/lang/String;

    .prologue
    .line 38
    const/16 v0, 0x8

    invoke-static {v0}, Lcom/boyaa/app/debug/Log;->permission(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 39
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    :cond_0
    return-void
.end method
