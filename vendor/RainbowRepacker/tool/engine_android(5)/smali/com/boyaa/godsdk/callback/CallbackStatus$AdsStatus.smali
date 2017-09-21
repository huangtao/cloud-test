.class public final Lcom/boyaa/godsdk/callback/CallbackStatus$AdsStatus;
.super Ljava/lang/Object;
.source "CallbackStatus.java"

# interfaces
.implements Lcom/boyaa/godsdk/callback/CallbackStatus$BaseCallbackStatus;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/boyaa/godsdk/callback/CallbackStatus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "AdsStatus"
.end annotation


# static fields
.field public static final ADS_STATUS_START:I = 0xc350

.field public static final RESULT_CODE_AdsDismissed:I = 0xc418

.field public static final RESULT_CODE_AdsReceived:I = 0xc350

.field public static final RESULT_CODE_AdsShown:I = 0xc3b4

.field public static final RESULT_CODE_EXIT:I = 0xc6d4

.field public static final RESULT_CODE_Failed:I = 0xc670

.field public static final RESULT_CODE_NetworkError:I = 0xc5a8

.field public static final RESULT_CODE_OfferWallOnPointsChanged:I = 0xc544

.field public static final RESULT_CODE_PointsSpendFailed:I = 0xc4e0

.field public static final RESULT_CODE_PointsSpendSucceed:I = 0xc47c

.field public static final RESULT_CODE_UnknownError:I = 0xc60c


# instance fields
.field final synthetic this$0:Lcom/boyaa/godsdk/callback/CallbackStatus;


# direct methods
.method public constructor <init>(Lcom/boyaa/godsdk/callback/CallbackStatus;)V
    .locals 0

    .prologue
    .line 192
    iput-object p1, p0, Lcom/boyaa/godsdk/callback/CallbackStatus$AdsStatus;->this$0:Lcom/boyaa/godsdk/callback/CallbackStatus;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
