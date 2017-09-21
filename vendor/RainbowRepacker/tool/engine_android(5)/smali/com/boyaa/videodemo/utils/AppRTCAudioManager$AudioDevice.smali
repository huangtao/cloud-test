.class public final enum Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;
.super Ljava/lang/Enum;
.source "AppRTCAudioManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/videodemo/utils/AppRTCAudioManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AudioDevice"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum EARPIECE:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

.field private static final synthetic ENUM$VALUES:[Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

.field public static final enum SPEAKER_PHONE:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

.field public static final enum WIRED_HEADSET:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 44
    new-instance v0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    const-string v1, "SPEAKER_PHONE"

    invoke-direct {v0, v1, v2}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->SPEAKER_PHONE:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    .line 45
    new-instance v0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    const-string v1, "WIRED_HEADSET"

    invoke-direct {v0, v1, v3}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->WIRED_HEADSET:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    .line 46
    new-instance v0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    const-string v1, "EARPIECE"

    invoke-direct {v0, v1, v4}, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->EARPIECE:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    .line 43
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    sget-object v1, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->SPEAKER_PHONE:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    aput-object v1, v0, v2

    sget-object v1, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->WIRED_HEADSET:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    aput-object v1, v0, v3

    sget-object v1, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->EARPIECE:Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    aput-object v1, v0, v4

    sput-object v0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->ENUM$VALUES:[Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    return-object v0
.end method

.method public static values()[Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;->ENUM$VALUES:[Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    array-length v1, v0

    new-array v2, v1, [Lcom/boyaa/videodemo/utils/AppRTCAudioManager$AudioDevice;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
