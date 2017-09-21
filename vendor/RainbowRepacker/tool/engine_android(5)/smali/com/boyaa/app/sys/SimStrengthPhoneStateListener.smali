.class public Lcom/boyaa/app/sys/SimStrengthPhoneStateListener;
.super Landroid/telephony/PhoneStateListener;
.source "SimStrengthPhoneStateListener.java"


# static fields
.field public static strength:I


# instance fields
.field private final MAX_RSSI:I

.field private final MIN_RSSI:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 67
    const/4 v0, 0x0

    sput v0, Lcom/boyaa/app/sys/SimStrengthPhoneStateListener;->strength:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 7
    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    .line 40
    const/16 v0, -0x64

    iput v0, p0, Lcom/boyaa/app/sys/SimStrengthPhoneStateListener;->MIN_RSSI:I

    .line 43
    const/16 v0, -0x37

    iput v0, p0, Lcom/boyaa/app/sys/SimStrengthPhoneStateListener;->MAX_RSSI:I

    .line 7
    return-void
.end method

.method public static getStrength()I
    .locals 1

    .prologue
    .line 70
    sget v0, Lcom/boyaa/app/sys/SimStrengthPhoneStateListener;->strength:I

    return v0
.end method


# virtual methods
.method public calculateSignalLevel(II)I
    .locals 3
    .param p1, "rssi"    # I
    .param p2, "numLevels"    # I

    .prologue
    .line 56
    const/16 v2, -0x64

    if-gt p1, v2, :cond_0

    .line 57
    const/4 v2, 0x0

    .line 63
    :goto_0
    return v2

    .line 58
    :cond_0
    const/16 v2, -0x37

    if-lt p1, v2, :cond_1

    .line 59
    add-int/lit8 v2, p2, -0x1

    goto :goto_0

    .line 61
    :cond_1
    const/high16 v0, 0x42340000    # 45.0f

    .line 62
    .local v0, "inputRange":F
    add-int/lit8 v2, p2, -0x1

    int-to-float v1, v2

    .line 63
    .local v1, "outputRange":F
    add-int/lit8 v2, p1, 0x64

    int-to-float v2, v2

    mul-float/2addr v2, v1

    div-float/2addr v2, v0

    float-to-int v2, v2

    goto :goto_0
.end method

.method public onSignalStrengthChanged(I)V
    .locals 0
    .param p1, "asu"    # I

    .prologue
    .line 12
    invoke-super {p0, p1}, Landroid/telephony/PhoneStateListener;->onSignalStrengthChanged(I)V

    .line 13
    return-void
.end method

.method public onSignalStrengthsChanged(Landroid/telephony/SignalStrength;)V
    .locals 5
    .param p1, "signalStrength"    # Landroid/telephony/SignalStrength;

    .prologue
    .line 18
    invoke-super {p0, p1}, Landroid/telephony/PhoneStateListener;->onSignalStrengthsChanged(Landroid/telephony/SignalStrength;)V

    .line 19
    const/4 v0, 0x0

    .line 20
    .local v0, "ASU":I
    const/4 v1, 0x0

    .line 22
    .local v1, "dBm":I
    if-eqz p1, :cond_0

    .line 24
    invoke-virtual {p1}, Landroid/telephony/SignalStrength;->getGsmSignalStrength()I

    move-result v0

    .line 25
    mul-int/lit8 v2, v0, 0x2

    add-int/lit8 v1, v2, -0x71

    .line 35
    :goto_0
    sput v1, Lcom/boyaa/app/sys/SimStrengthPhoneStateListener;->strength:I

    .line 36
    const-string v2, "SimStrengthPhoneStateListener"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "ASU="

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ",dBm="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ",level="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/4 v4, 0x4

    invoke-virtual {p0, v1, v4}, Lcom/boyaa/app/sys/SimStrengthPhoneStateListener;->calculateSignalLevel(II)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    return-void

    .line 31
    :cond_0
    const/4 v0, 0x0

    .line 32
    const/4 v1, 0x0

    goto :goto_0
.end method
