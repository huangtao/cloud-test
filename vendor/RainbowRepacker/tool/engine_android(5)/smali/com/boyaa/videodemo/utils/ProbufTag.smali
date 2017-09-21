.class public Lcom/boyaa/videodemo/utils/ProbufTag;
.super Ljava/lang/Object;
.source "ProbufTag.java"


# static fields
.field public static final AUDIO_CONTROL_NOTIFY:I = 0x11

.field public static final AUDIO_CONTROL_NOTIFY_VALUE:Ljava/lang/String; = "NotifyAudioCtrol"

.field public static final AUDIO_CONTROL_RESPONSE:I = 0x12

.field public static final AUDIO_CONTROL_RESPONSE_VALUE:Ljava/lang/String; = "AudioCtrolResponse"

.field public static final AUDIO_NOTIFY:I = 0x7

.field public static final AUDIO_NOTIFY_VALUE:Ljava/lang/String; = "AudioNotify"

.field public static final DOWNMIC_NOTIFY:I = 0x9

.field public static final DOWN_MIC_REPONSE:I = 0x6

.field public static final DOWN_MIC_REPONSE_VALUE:Ljava/lang/String; = "DownMicResponse"

.field public static final DOWN_NOTIFY_VALUE:Ljava/lang/String; = "DownMicNotify"

.field public static final ENTER_ROOM_NOTIFY:I = 0x3

.field public static final ENTER_ROOM_NOTIFY_VALUE:Ljava/lang/String; = "EnterRoomNotify"

.field public static final LEAVE_ROOM_NOTIFY:I = 0x4

.field public static final LEAVE_ROOM_NOTIFY_VALUE:Ljava/lang/String; = "LeaveRoomNotify"

.field public static final LOGIN_RESPONSE:I = 0x1

.field public static final LOGIN_RESPONSE_VALUE:Ljava/lang/String; = "LoginVideoRoomResponse"

.field public static final MEDIA_CONTROL_RESPONSE:I = 0x10

.field public static final MEDIA_CONTROL_RESPONSE_VALUE:Ljava/lang/String; = "MediaControlResponse"

.field public static final UPMIC_NOTIFY:I = 0x8

.field public static final UPMIC_NOTIFY_VALUE:Ljava/lang/String; = "UpMicNotify"

.field public static final UP_MIC_REPONSE:I = 0x5

.field public static final UP_MIC_REPONSE_VALUE:Ljava/lang/String; = "UpMicResponse"

.field public static final VEDIO_NOTIFY:I = 0x2

.field public static final VEDIO_NOTIFY_VALUE:Ljava/lang/String; = "VideoNotify"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static GetMessageName(Ljava/lang/String;)I
    .locals 1
    .param p0, "strName"    # Ljava/lang/String;

    .prologue
    .line 45
    const-string v0, "LoginVideoRoomResponse"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 46
    const/4 v0, 0x1

    .line 72
    :goto_0
    return v0

    .line 47
    :cond_0
    const-string v0, "VideoNotify"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 48
    const/4 v0, 0x2

    goto :goto_0

    .line 49
    :cond_1
    const-string v0, "LeaveRoomNotify"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 50
    const/4 v0, 0x4

    goto :goto_0

    .line 51
    :cond_2
    const-string v0, "EnterRoomNotify"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 52
    const/4 v0, 0x3

    goto :goto_0

    .line 53
    :cond_3
    const-string v0, "UpMicResponse"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 54
    const/4 v0, 0x5

    goto :goto_0

    .line 55
    :cond_4
    const-string v0, "DownMicResponse"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 56
    const/4 v0, 0x6

    goto :goto_0

    .line 57
    :cond_5
    const-string v0, "AudioNotify"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 58
    const/4 v0, 0x7

    goto :goto_0

    .line 59
    :cond_6
    const-string v0, "UpMicNotify"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 60
    const/16 v0, 0x8

    goto :goto_0

    .line 61
    :cond_7
    const-string v0, "DownMicNotify"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 62
    const/16 v0, 0x9

    goto :goto_0

    .line 63
    :cond_8
    const-string v0, "MediaControlResponse"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    .line 64
    const/16 v0, 0x10

    goto :goto_0

    .line 65
    :cond_9
    const-string v0, "NotifyAudioCtrol"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 66
    const/16 v0, 0x11

    goto :goto_0

    .line 67
    :cond_a
    const-string v0, "AudioCtrolResponse"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 68
    const/16 v0, 0x12

    goto :goto_0

    .line 72
    :cond_b
    const/4 v0, 0x0

    goto :goto_0
.end method
