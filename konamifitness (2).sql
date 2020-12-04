-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2020 at 05:02 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `konamifitness`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `code` varchar(5) NOT NULL,
  `mets` decimal(5,2) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`code`, `mets`, `category_id`, `description`) VALUES
('01003', '14.00', 1, 'Bicycling, mountain, uphill, vigorous'),
('01004', '16.00', 1, 'Bicycling, mountain, competitive, racing'),
('01008', '8.50', 1, 'Bicycling, BMX'),
('01009', '8.50', 1, 'Bicycling, mountain, general'),
('01010', '4.00', 1, 'Bicycling, <10 mph, leisure, to work or for pleasure (Taylor Code 115)'),
('01011', '6.80', 1, 'Bicycling, to/from work, self selected pace'),
('01013', '5.80', 1, 'Bicycling, on dirt or farm road, moderate pace'),
('01015', '7.50', 1, 'Bicycling, general'),
('01018', '3.50', 1, 'Bicycling, leisure, 5.5 mph'),
('01019', '5.80', 1, 'Bicycling, leisure, 9.4 mph'),
('01020', '6.80', 1, 'Bicycling, 10-11.9 mph, leisure, slow, light effort'),
('01030', '8.00', 1, 'Bicycling, 12-13.9 mph, leisure, moderate effort'),
('01040', '10.00', 1, 'Bicycling, 14-15.9 mph, racing or leisure, fast, vigorous effort'),
('01050', '12.00', 1, 'Bicycling, 16-19 mph, racing/not drafting or > 19 mph drafting, very fast, racing general'),
('01060', '15.80', 1, 'Bicycling, > 20 mph, racing, not drafting'),
('01065', '8.50', 1, 'Bicycling, 12 mph, seated, hands on brake hoods or bar drops, 80 rpm'),
('01066', '9.00', 1, 'Bicycling, 12 mph, standing, hands on brake hoods, 60 rpm'),
('01070', '5.00', 1, 'Unicycling'),
('02001', '2.30', 2, 'Activity promoting video game (e.g., Wii Fit), light effort (e.g., balance, yoga)'),
('02003', '3.80', 2, 'Activity promoting video game (e.g., Wii Fit), moderate effort (e.g., aerobic, resistance)'),
('02005', '7.20', 2, 'Activity promoting video/arcade game (e.g., Exergaming, Dance Dance Revolution), vigorous effort'),
('02008', '5.00', 2, 'Army type obstacle course exercise, boot camp training program'),
('02010', '7.00', 2, 'Bicycling, stationary, general'),
('02011', '3.50', 2, 'Bicycling, stationary, 30-50 watts, very light to light effort'),
('02012', '6.80', 2, 'Bicycling, stationary, 90-100 watts, moderate to vigorous effort'),
('02013', '8.80', 2, 'Bicycling, stationary, 101-160 watts, vigorous effort'),
('02014', '11.00', 2, 'Bicycling, stationary, 161-200 watts, vigorous effort'),
('02015', '14.00', 2, 'Bicycling, stationary, 201-270 watts, very vigorous effort'),
('02017', '4.80', 2, 'Bicycling, stationary, 51-89 watts, light-to-moderate effort'),
('02019', '8.50', 2, 'Bicycling, stationary, RPM/Spin bike class'),
('02020', '8.00', 2, 'Calisthenics (e.g., push ups, sit ups, pull-ups, jumping jacks), vigorous effort'),
('02022', '3.80', 2, 'Calisthenics (e.g., push ups, sit ups, pull-ups, lunges), moderate effort'),
('02024', '2.80', 2, 'Calisthenics (e.g., situps, abdominal crunches), light effort'),
('02030', '3.50', 2, 'Calisthenics, light or moderate effort, general (e.g., back exercises), going up & down from floor (Taylor Code 150)'),
('02035', '4.30', 2, 'Circuit training, moderate effort'),
('02040', '8.00', 2, 'Circuit training, including kettlebells, some aerobic movement with minimal rest, general, vigorous intensity'),
('02045', '3.50', 2, 'Curves(TM) Eexercise routines in women'),
('02048', '5.00', 2, 'Elliptical trainer, moderate effort'),
('02050', '6.00', 2, 'Resistance training (weight lifting, free weight, nautilus or universal), power lifting or body building, vigorous effort (Taylor Code 210)'),
('02052', '5.00', 2, 'Resistance (weight) training, squats , slow or explosive effort'),
('02054', '3.50', 2, 'Resistance (weight) training, multiple exercises, 8-15 repetitions at varied resistance'),
('02060', '5.50', 2, 'Health club exercise, general (Taylor Code 160)'),
('02061', '5.00', 2, 'Health club exercise classes, general, gym/weight training combined in one visit'),
('02062', '7.80', 2, 'Health club exercise, conditioning classes'),
('02064', '3.80', 2, 'Home exercise, general'),
('02065', '9.00', 2, 'Stair-treadmill ergometer, general'),
('02068', '12.30', 2, 'Rope skipping, general'),
('02070', '6.00', 2, 'Rowing, stationary ergometer, general, vigorous effort'),
('02071', '4.80', 2, 'Rowing, stationary, general, moderate effort'),
('02072', '7.00', 2, 'Rowing, stationary, 100 watts, moderate effort'),
('02073', '8.50', 2, 'Rowing, stationary, 150 watts, vigorous effort'),
('02074', '12.00', 2, 'Rowing, stationary, 200 watts, very vigorous effort'),
('02080', '6.80', 2, 'Ski machine, general'),
('02085', '11.00', 2, 'Slide board exercise, general'),
('02090', '6.00', 2, 'Slimnastics, Jazzercise'),
('02101', '2.30', 2, 'Stretching, mild'),
('02105', '3.00', 2, 'Pilates, general'),
('02110', '6.80', 2, 'Teaching exercise class (e.g., aerobic, water)'),
('02112', '2.80', 2, 'Therapeutic exercise ball, Fitball exercise'),
('02115', '2.80', 2, 'Upper body exercise, arm ergometer'),
('02117', '4.30', 2, 'Upper body exercise, stationary bicycle - Airdyne (arms only) 40 rpm, moderate'),
('02120', '5.30', 2, 'Water aerobics, water calisthenics, water exercise'),
('02135', '1.30', 2, 'Whirlpool, sitting'),
('02140', '2.30', 2, 'Video exercise workouts, TV conditioning programs (e.g., yoga, stretching), light effort'),
('02143', '4.00', 2, 'Video exercise workouts, TV conditioning programs (e.g., cardio-resistance), moderate effort'),
('02146', '6.00', 2, 'Video exercise workouts, TV conditioning programs (e.g., cardio-resistance), vigorous effort'),
('02150', '2.50', 2, 'Yoga, Hatha'),
('02160', '4.00', 2, 'Yoga, Power'),
('02170', '2.00', 2, 'Yoga, Nadisodhana'),
('02180', '3.30', 2, 'Yoga, Surya Namaskar'),
('02200', '5.30', 2, 'Native New Zealander physical activities (e.g., Haka Powhiri, Moteatea, Waita Tira, Whakawatea, etc.), general, moderate effort'),
('02205', '6.80', 2, 'Native New Zealander physical activities (e.g., Haka, Taiahab), general, vigorous effort'),
('03010', '5.00', 3, 'Ballet, modern, or jazz, general, rehearsal or class'),
('03012', '6.80', 3, 'Ballet, modern, or jazz, performance, vigorous effort'),
('03014', '4.80', 3, 'Tap'),
('03015', '7.30', 3, 'Aerobic, general'),
('03016', '7.50', 3, 'Aerobic, step, with 6 - 8 inch step'),
('03017', '9.50', 3, 'Aerobic, step, with 10 - 12 inch step'),
('03018', '5.50', 3, 'Aerobic, step, with 4-inch step'),
('03019', '8.50', 3, 'Bench step class, general'),
('03020', '5.00', 3, 'Aerobic, low impact'),
('03021', '7.30', 3, 'Aerobic, high impact'),
('03022', '10.00', 3, 'Aerobic dance wearing 10-15 lb weights'),
('03025', '4.50', 3, 'Ethnic or cultural dancing (e.g., Greek, Middle Eastern, hula, salsa, merengue, bamba y plena, flamenco, belly, and swing)'),
('03030', '5.50', 3, 'Ballroom, fast (Taylor Code 125)'),
('03031', '7.80', 3, 'General dancing (e.g., disco, folk, Irish step dancing, line dancing, polka, contra, country)'),
('03038', '11.30', 3, 'Ballroom dancing, competitive, general'),
('03040', '3.00', 3, 'Ballroom, slow (e.g., waltz, foxtrot, slow dancing, samba, tango, 19th century dance, mambo, cha cha)'),
('03050', '5.50', 3, 'Anishinaabe Jingle Dancing'),
('03060', '3.50', 3, 'Caribbean dance (Abakua, Beguine, Bellair, Bongo, Brukin\'s, Caribbean Quadrills, Dinki Mini, Gere, Gumbay, Ibo, Jonkonnu, Kumina, Oreisha, Jambu)'),
('04001', '3.50', 4, 'Fishing, general'),
('04005', '4.50', 4, 'Fishing, crab fishing'),
('04007', '4.00', 4, 'Fishing, catching fish with hands'),
('04010', '4.30', 4, 'Fishing related, digging worms, with shovel'),
('04020', '4.00', 4, 'Fishing from river bank and walking'),
('04030', '2.00', 4, 'Fishing from boat or canoe, sitting'),
('04040', '3.50', 4, 'Fishing from river bank, standing (Taylor Code 660)'),
('04050', '6.00', 4, 'Fishing in stream, in waders (Taylor Code 670)'),
('04060', '2.00', 4, 'Fishing, ice, sitting'),
('04061', '1.80', 4, 'Fishing, jog or line, standing, general'),
('04062', '3.50', 4, 'Fishing, dip net, setting net and retrieving fish, general'),
('04063', '3.80', 4, 'Fishing, set net, setting net and retrieving fish, general'),
('04064', '3.00', 4, 'Fishing, fishing wheel, setting net and retrieving fish, general'),
('04065', '2.30', 4, 'Fishing with a spear, standing'),
('04070', '2.50', 4, 'Hunting, bow and arrow, or crossbow'),
('04080', '6.00', 4, 'Hunting, deer, elk, large game (Taylor Code 170)'),
('04081', '11.30', 4, 'Hunting large game, dragging carcass'),
('04083', '4.00', 4, 'Hunting large marine animals'),
('04085', '2.50', 4, 'Hunting large game, from a hunting stand, limited walking'),
('04086', '2.00', 4, 'Hunting large game from a car, plane, or boat'),
('04090', '2.50', 4, 'Hunting, duck, wading'),
('04095', '3.00', 4, 'Hunting, flying fox, squirrel'),
('04100', '5.00', 4, 'Hunting, general'),
('04110', '6.00', 4, 'Hunting, pheasants or grouse (Taylor Code 680)'),
('04115', '3.30', 4, 'Hunting, birds'),
('04120', '5.00', 4, 'Hunting, rabbit, squirrel, prairie chick, raccoon, small game (Taylor Code 690)'),
('04123', '3.30', 4, 'Hunting, pigs, wild'),
('04124', '2.00', 4, 'Trapping game, general'),
('04125', '9.50', 4, 'Hunting, hiking with hunting gear'),
('04130', '2.50', 4, 'Pistol shooting or trap shooting, standing'),
('04140', '2.30', 4, 'Rifle exercises, shooting, lying down'),
('04145', '2.50', 4, 'Rifle exercises, shooting, kneeling or standing'),
('05010', '3.30', 5, 'Cleaning, sweeping carpet or floors, general'),
('05011', '2.30', 5, 'Cleaning, sweeping, slow, light effort'),
('05012', '3.80', 5, 'Cleaning, sweeping, slow, moderate effort'),
('05020', '3.50', 5, 'Cleaning, heavy or major (e.g. wash car, wash windows, clean garage), moderate effort'),
('05021', '3.50', 5, 'Cleaning, mopping, standing, moderate effort'),
('05022', '3.20', 5, 'Cleaning windows, washing windows, general'),
('05023', '2.50', 5, 'Mopping, standing, light effort'),
('05024', '4.50', 5, 'Polishing floors, standing, walking slowly, using electric polishing machine'),
('05025', '2.80', 5, 'Multiple household tasks all at once, light effort'),
('05026', '3.50', 5, 'Multiple household tasks all at once, moderate effort'),
('05027', '4.30', 5, 'Multiple household tasks all at once, vigorous effort'),
('05030', '3.30', 5, 'Cleaning, house or cabin, general, moderate effort'),
('05032', '2.30', 5, 'Dusting or polishing furniture, general'),
('05035', '3.30', 5, 'Kitchen activity, general, (e.g., cooking, washing dishes, cleaning up), moderate effort'),
('05040', '2.50', 5, 'Cleaning, general (straightening up, changing linen, carrying out trash, light effort'),
('05041', '1.80', 5, 'Wash dishes, standing or in general (not broken into stand/walk components)'),
('05042', '2.50', 5, 'Wash dishes, clearing dishes from table, walking, light effort'),
('05043', '3.30', 5, 'Vacuuming, general, moderate effort'),
('05044', '3.00', 5, 'Butchering animals, small'),
('05045', '6.00', 5, 'Butchering animal, large, vigorous effort'),
('05046', '2.30', 5, 'Cutting and smoking fish, drying fish or meat'),
('05048', '4.00', 5, 'Tanning hides, general'),
('05049', '3.50', 5, 'Cooking or food preparation, moderate effort'),
('05050', '2.00', 5, 'Cooking or food preparation - standing or sitting or in general (not broken into stand/walk components), manual appliances, light effort'),
('05051', '2.50', 5, 'Serving food, setting table, implied walking or standing'),
('05052', '2.50', 5, 'Cooking or food preparation, walking'),
('05053', '2.50', 5, 'Feeding household animals'),
('05055', '2.50', 5, 'Putting away groceries (e.g. carrying groceries, shopping without a grocery cart), carrying packages'),
('05056', '7.50', 5, 'Carrying groceries upstairs'),
('05057', '3.00', 5, 'Cooking Indian bread on an outside stove'),
('05060', '2.30', 5, 'Food shopping with or without a grocery cart, standing or walking'),
('05065', '2.30', 5, 'Non-food shopping, with or without a cart, standing or walking'),
('05070', '1.80', 5, 'Ironing'),
('05080', '1.30', 5, 'Knitting, sewing, light effort, wrapping presents, sitting'),
('05082', '2.80', 5, 'Sewing with a machine'),
('05090', '2.00', 5, 'Laundry, fold or hang clothes, put clothes in washer or dryer, packing suitcase, washing clothes by hand, implied standing, light effort'),
('05092', '4.00', 5, 'Laundry, hanging wash, washing clothes by hand, moderate effort'),
('05095', '2.30', 5, 'Laundry, putting away clothes, gathering clothes to pack, putting away laundry, implied walking'),
('05100', '3.30', 5, 'Making bed, changing linens'),
('05110', '5.00', 5, 'Maple syruping/sugar bushing (including carrying buckets, carrying wood)'),
('05120', '5.80', 5, 'Moving furniture, household items, carrying boxes'),
('05121', '5.00', 5, 'Moving, lifting light loads'),
('05125', '4.80', 5, 'Organizing room'),
('05130', '3.50', 5, 'Scrubbing floors, on hands and knees, scrubbing bathroom, bathtub, moderate effort'),
('05131', '2.00', 5, 'Scrubbing floors, on hands and knees, scrubbing bathroom, bathtub, light effort'),
('05132', '6.50', 5, 'Scrubbing floors, on hands and knees, scrubbing bathroom, bathtub, vigorous effort'),
('05140', '4.00', 5, 'Sweeping garage, sidewalk or outside of house'),
('05146', '3.50', 5, 'Standing, packing/unpacking boxes, occasional lifting of lightweight household items, loading or unloading items in car, moderate effort'),
('05147', '3.00', 5, 'Implied walking, putting away household items, moderate effort'),
('05148', '2.50', 5, 'Watering plants'),
('05149', '2.50', 5, 'Building a fire inside'),
('05150', '9.00', 5, 'Moving household items upstairs, carrying boxes or furniture'),
('05160', '2.00', 5, 'Standing, light effort tasks (pump gas, change light bulb, etc.)'),
('05165', '3.50', 5, 'Walking, moderate effort tasks, non-cleaning (readying to leave, shut/lock doors, close windows, etc.)'),
('05170', '2.20', 5, 'Sitting, playing with child(ren), light effort, only active periods'),
('05171', '2.80', 5, 'Standing, playing with child(ren) light effort, only active periods'),
('05175', '3.50', 5, 'Walking/running, playing with child(ren), moderate effort, only active periods'),
('05180', '5.80', 5, 'Walking/running, playing with child(ren), vigorous effort, only active periods'),
('05181', '3.00', 5, 'Walking and carrying small child, child weighing 15 lbs or more'),
('05182', '2.30', 5, 'Walking and carrying small child, child weighing less than 15 lbs'),
('05183', '2.00', 5, 'Standing, holding child'),
('05184', '2.50', 5, 'Child care, infant, general'),
('05185', '2.00', 5, 'Child care, sitting/kneeling (e.g., dressing, bathing, grooming, feeding, occasional lifting of child), light effort, general'),
('05186', '3.00', 5, 'Child care, standing (e.g., dressing, bathing, grooming, feeding, occasional lifting of child), moderate effort'),
('05188', '1.50', 5, 'Reclining with baby'),
('05189', '2.00', 5, 'Breastfeeding, sitting or reclining'),
('05190', '2.50', 5, 'Sit, playing with animals, light effort, only active periods'),
('05191', '2.80', 5, 'Stand, playing with animals, light effort, only active periods'),
('05192', '3.00', 5, 'Walk/run, playing with animals, general, light effort, only active periods'),
('05193', '4.00', 5, 'Walk/run, playing with animals, moderate effort, only active periods'),
('05194', '5.00', 5, 'Walk/run, playing with animals, vigorous effort, only active periods'),
('05195', '3.50', 5, 'Standing, bathing dog'),
('05197', '2.30', 5, 'Animal care, household animals, general'),
('05200', '4.00', 5, 'Elder care, disabled adult, bathing, dressing, moving into and out of bed, only active periods'),
('05205', '2.30', 5, 'Elder care, disabled adult, feeding, combing hair, light effort, only active periods'),
('06010', '3.00', 6, 'Airplane repair'),
('06020', '4.00', 6, 'Automobile body work'),
('06030', '3.30', 6, 'Automobile repair, light or moderate effort'),
('06040', '3.00', 6, 'Carpentry, general, workshop (Taylor Code 620)'),
('06050', '6.00', 6, 'Carpentry, outside house, installing rain gutters (Taylor Code 640),carpentry, outside house, building a fence'),
('06052', '3.80', 6, 'Carpentry, outside house, building a fence'),
('06060', '3.30', 6, 'Carpentry, finishing or refinishing cabinets or furniture'),
('06070', '6.00', 6, 'Carpentry, sawing hardwood'),
('06072', '4.00', 6, 'Carpentry, home remodeling tasks, moderate effort'),
('06074', '2.30', 6, 'Carpentry, home remodeling tasks, light effort'),
('06080', '5.00', 6, 'Caulking, chinking log cabin'),
('06090', '4.50', 6, 'Caulking, except log cabin'),
('06100', '5.00', 6, 'Cleaning gutters'),
('06110', '5.00', 6, 'Excavating garage'),
('06120', '5.00', 6, 'Hanging storm windows'),
('06122', '5.00', 6, 'Hanging sheet rock inside house'),
('06124', '3.00', 6, 'Hammering nails'),
('06126', '2.50', 6, 'Home repair, general, light effort'),
('06127', '4.50', 6, 'Home repair, general, moderate effort'),
('06128', '6.00', 6, 'Home repair, general, vigorous effort'),
('06130', '4.50', 6, 'Laying or removing carpet'),
('06140', '3.80', 6, 'Laying tile or linoleum,repairing appliances'),
('06144', '3.00', 6, 'Repairing appliances'),
('06150', '5.00', 6, 'Painting, outside home (Taylor Code 650)'),
('06160', '3.30', 6, 'Painting inside house,wallpapering, scraping paint'),
('06165', '4.50', 6, 'Painting, (Taylor Code 630)'),
('06167', '3.00', 6, 'Plumbing, general'),
('06170', '3.00', 6, 'Put on and removal of tarp - sailboat'),
('06180', '6.00', 6, 'Roofing'),
('06190', '4.50', 6, 'Sanding floors with a power sander'),
('06200', '4.50', 6, 'Scraping and painting sailboat or powerboat'),
('06205', '2.00', 6, 'Sharpening tools'),
('06210', '5.00', 6, 'Spreading dirt with a shovel'),
('06220', '4.50', 6, 'Washing and waxing hull of sailboat or airplane'),
('06225', '2.00', 6, 'Washing and waxing car'),
('06230', '4.50', 6, 'Washing fence, painting fence, moderate effort'),
('06240', '3.30', 6, 'Wiring, tapping-splicing'),
('07010', '1.00', 7, 'Lying quietly and watching television'),
('07011', '1.30', 7, 'Lying quietly, doing nothing, lying in bed awake, listening to music (not talking or reading)'),
('07020', '1.30', 7, 'Sitting quietly and watching television'),
('07021', '1.30', 7, 'Sitting quietly, general'),
('07022', '1.50', 7, 'Sitting quietly, fidgeting, general, fidgeting hands'),
('07023', '1.80', 7, 'Sitting, fidgeting feet'),
('07024', '1.30', 7, 'Sitting, smoking'),
('07025', '1.50', 7, 'Sitting, listening to music (not talking or reading) or watching a movie in a theater'),
('07026', '1.30', 7, 'Sitting at a desk, resting head in hands'),
('07030', '1.00', 7, 'Sleeping'),
('07040', '1.30', 7, 'Standing quietly, standing in a line'),
('07041', '1.80', 7, 'Standing, fidgeting'),
('07050', '1.30', 7, 'Reclining, writing'),
('07060', '1.30', 7, 'Reclining, talking or talking on phone'),
('07070', '1.30', 7, 'Reclining, reading'),
('07075', '1.00', 7, 'Meditating'),
('08009', '3.30', 8, 'Carrying, loading or stacking wood, loading/unloading or carrying lumber, light-to-moderate effort'),
('08010', '5.50', 8, 'Carrying, loading or stacking wood, loading/unloading or carrying lumber'),
('08019', '4.50', 8, 'Chopping wood, splitting logs, moderate effort'),
('08020', '6.30', 8, 'Chopping wood, splitting logs, vigorous effort'),
('08025', '3.50', 8, 'Clearing light brush, thinning garden, moderate effort'),
('08030', '6.30', 8, 'Clearing brush/land, undergrowth, or ground, hauling branches, wheelbarrow chores, vigorous effort'),
('08040', '5.00', 8, 'Digging sandbox, shoveling sand'),
('08045', '3.50', 8, 'Digging, spading, filling garden, composting, light-to-moderate effort'),
('08050', '5.00', 8, 'Digging, spading, filling garden, compositing, (Taylor Code 590)'),
('08052', '7.80', 8, 'Digging, spading, filling garden, composting, vigorous effort'),
('08055', '2.80', 8, 'Driving tractor'),
('08057', '8.30', 8, 'Felling trees, large size'),
('08058', '5.30', 8, 'Felling trees, small-medium size'),
('08060', '5.80', 8, 'Gardening with heavy power tools, tilling a garden, chain saw'),
('08065', '2.30', 8, 'Gardening, using containers, older adults > 60 years'),
('08070', '4.00', 8, 'Irrigation channels, opening and closing ports'),
('08080', '6.30', 8, 'Laying crushed rock'),
('08090', '5.00', 8, 'Laying sod'),
('08095', '5.50', 8, 'Mowing lawn, general'),
('08100', '2.50', 8, 'Mowing lawn, riding mower (Taylor Code 550)'),
('08110', '6.00', 8, 'Mowing lawn, walk, hand mower (Taylor Code 570)'),
('08120', '5.00', 8, 'Mowing lawn, walk, power mower, moderate or vigorous effort'),
('08125', '4.50', 8, 'Mowing lawn, power mower, light or moderate effort (Taylor Code 590)'),
('08130', '2.50', 8, 'Operating snow blower, walking'),
('08135', '2.00', 8, 'Planting, potting, transplanting seedlings or plants, light effort'),
('08140', '4.30', 8, 'Planting seedlings, shrub, stooping, moderate effort'),
('08145', '4.30', 8, 'Planting crops or garden, stooping, moderate effort'),
('08150', '4.50', 8, 'Planting trees'),
('08160', '3.80', 8, 'Raking lawn or leaves, moderate effort'),
('08165', '4.00', 8, 'Raking lawn (Taylor Code 600)'),
('08170', '4.00', 8, 'Raking roof with snow rake'),
('08180', '3.00', 8, 'Riding snow blower'),
('08190', '4.00', 8, 'Sacking grass, leaves'),
('08192', '5.50', 8, 'Shoveling dirt or mud'),
('08195', '5.30', 8, 'Shoveling snow, by hand, moderate effort'),
('08200', '6.00', 8, 'Shovelling snow, by hand (Taylor Code 610)'),
('08202', '7.50', 8, 'Shoveling snow, by hand, vigorous effort'),
('08210', '4.00', 8, 'Trimming shrubs or trees, manual cutter'),
('08215', '3.50', 8, 'Trimming shrubs or trees, power cutter, using leaf blower, edge, moderate effort'),
('08220', '3.00', 8, 'Walking, applying fertilizer or seeding a lawn, push applicator'),
('08230', '1.50', 8, 'Watering lawn or garden, standing or walking'),
('08239', '3.50', 8, 'Weeding, cultivating garden, light-to-moderate effort'),
('08240', '4.50', 8, 'Weeding, cultivating garden (Taylor Code 580)'),
('08241', '5.00', 8, 'Weeding, cultivating garden, using a hoe, moderate-to-vigorous effort'),
('08245', '3.80', 8, 'Gardening, general, moderate effort'),
('08246', '3.50', 8, 'Picking fruit off trees, picking fruits/vegetables, moderate effort'),
('08248', '4.50', 8, 'Picking fruit off trees, gleaning fruits, picking fruits/vegetables, climbing ladder to pick fruit, vigorous effort'),
('08250', '3.30', 8, 'Implied walking/standing - picking up yard, light, picking flowers or vegetables'),
('08251', '3.00', 8, 'Walking, gathering gardening tools'),
('08255', '5.50', 8, 'Wheelbarrow, pushing garden cart or wheelbarrow'),
('08260', '3.00', 8, 'Yard work, general, light effort'),
('08261', '4.00', 8, 'Yard work, general, moderate effort'),
('08262', '6.00', 8, 'Yard work, general, vigorous effort'),
('09000', '1.50', 9, 'Board game playing, sitting'),
('09005', '2.50', 9, 'Casino gambling, standing'),
('09010', '1.50', 9, 'Card playing, sitting'),
('09013', '1.50', 9, 'Chess game, sitting'),
('09015', '1.50', 9, 'Copying documents, standing'),
('09020', '1.80', 9, 'Drawing, writing, painting, standing'),
('09025', '1.00', 9, 'Laughing, sitting'),
('09030', '1.30', 9, 'Sitting, reading, book, newspaper, etc.'),
('09040', '1.30', 9, 'Sitting, writing, desk work, typing'),
('09045', '1.00', 9, 'Sitting, playing traditional video game, computer game'),
('09050', '1.80', 9, 'Standing, talking in person, on the phone, computer, or text messaging, light effort'),
('09055', '1.50', 9, 'Sitting, talking in person, on the phone, computer, or text messaging, light effort'),
('09060', '1.30', 9, 'Sitting, studying, general, including reading and/or writing, light effort'),
('09065', '1.80', 9, 'Sitting, in class, general, including note-taking or class discussion'),
('09070', '1.80', 9, 'Standing, reading'),
('09071', '2.50', 9, 'Standing, miscellaneous'),
('09075', '1.80', 9, 'Sitting, arts and crafts, carving wood, weaving, spinning wool, light effort'),
('09080', '3.00', 9, 'Sitting, arts and crafts, carving wood, weaving, spinning wool, moderate effort'),
('09085', '2.50', 9, 'Standing, arts and crafts, sand painting, carving, weaving, light effort'),
('09090', '3.30', 9, 'Standing, arts and crafts, sand painting, carving, weaving, moderate effort'),
('09095', '3.50', 9, 'Standing, arts and crafts, sand painting, carving, weaving, vigorous effort'),
('09100', '1.80', 9, 'Retreat/family reunion activities involving sitting, relaxing, talking, eating'),
('09101', '3.00', 9, 'Retreat/family reunion activities involving playing games with children'),
('09105', '2.00', 9, 'Touring/traveling/vacation involving riding in a vehicle'),
('09106', '3.50', 9, 'Touring/traveling/vacation involving walking'),
('09110', '2.50', 9, 'Camping involving standing, walking, sitting, light-to-moderate effort'),
('09115', '1.50', 9, 'Sitting at a sporting event, spectator'),
('10010', '1.80', 10, 'Accordion, sitting'),
('10020', '2.30', 10, 'Cello, sitting'),
('10030', '2.30', 10, 'Conducting orchestra, standing'),
('10035', '2.50', 10, 'Double bass, standing'),
('10040', '3.80', 10, 'Drums, sitting'),
('10045', '3.00', 10, 'Drumming (e.g., bongo, conga, benbe), moderate, sitting'),
('10050', '2.00', 10, 'Flute, sitting'),
('10060', '1.80', 10, 'Horn, standing'),
('10070', '2.30', 10, 'Piano, sitting'),
('10074', '2.00', 10, 'Playing musical instruments, general'),
('10077', '2.00', 10, 'Organ, sitting'),
('10080', '3.50', 10, 'Trombone, standing'),
('10090', '1.80', 10, 'Trumpet, standing'),
('10100', '2.50', 10, 'Violin, sitting'),
('10110', '1.80', 10, 'Woodwind, sitting'),
('10120', '2.00', 10, 'Guitar, classical, folk, sitting'),
('10125', '3.00', 10, 'Guitar, rock and roll band, standing'),
('10130', '4.00', 10, 'Marching band, baton twirling, walking, moderate pace, general'),
('10131', '5.50', 10, 'Marching band, playing an instrument, walking, brisk pace, general'),
('10135', '3.50', 10, 'Marching band, drum major, walking'),
('11003', '2.30', 11, 'Active workstation, treadmill desk, walking'),
('11006', '3.00', 11, 'Airline flight attendant'),
('11010', '4.00', 11, 'Bakery, general, moderate effort'),
('11015', '2.00', 11, 'Bakery, light effort'),
('11020', '2.30', 11, 'Bookbinding'),
('11030', '6.00', 11, 'Building road, driving heavy machinery'),
('11035', '2.00', 11, 'Building road, directing traffic, standing'),
('11038', '2.50', 11, 'Carpentry, general, light effort'),
('11040', '4.30', 11, 'Carpentry, general, moderate effort'),
('11042', '7.00', 11, 'Carpentry, general, heavy or vigorous effort'),
('11050', '8.00', 11, 'Carrying heavy loads (e.g., bricks, tools)'),
('11060', '8.00', 11, 'Carrying moderate loads up stairs, moving boxes 25-49 lbs'),
('11070', '4.00', 11, 'Chambermaid, hotel housekeeper, making bed, cleaning bathroom, pushing cart'),
('11080', '5.30', 11, 'Coal mining, drilling coal, rock'),
('11090', '5.00', 11, 'Coal mining, erecting supports'),
('11100', '5.50', 11, 'Coal mining, general'),
('11110', '6.30', 11, 'Coal mining, shoveling coal'),
('11115', '2.50', 11, 'Cook, chef'),
('11120', '4.00', 11, 'Construction, outside, remodeling, new structures (e.g., roof repair, miscellaneous)'),
('11125', '2.30', 11, 'Custodial work, light effort (e.g., cleaning sink and toilet, dusting, vacuuming, light cleaning)'),
('11126', '3.80', 11, 'Custodial work, moderate effort (e.g., electric buffer, feathering arena floors, mopping, taking out trash, vacuuming)'),
('11130', '3.30', 11, 'Electrical work (e.g., hook up wire, tapping-splicing)'),
('11135', '1.80', 11, 'Engineer (e.g., mechanical or electrical)'),
('11145', '7.80', 11, 'Farming, vigorous effort (e.g., baling hay, cleaning barn)'),
('11146', '4.80', 11, 'Farming, moderate effort (e.g., feeding animals, chasing cattle by walking and/or horseback, spreading manure, harvesting crops)'),
('11147', '2.00', 11, 'Farming, light effort (e.g., cleaning animal sheds, preparing animal feed)'),
('11170', '2.80', 11, 'Farming, driving tasks (e.g., driving tractor or harvester)'),
('11180', '3.50', 11, 'Farming, feeding small animals'),
('11190', '4.30', 11, 'Farming, feeding cattle, horses'),
('11191', '4.30', 11, 'Farming, hauling water for animals, general hauling water,farming, general hauling water'),
('11192', '4.50', 11, 'Farming, taking care of animals (e.g., grooming, brushing, shearing sheep, assisting with birthing, medical care, branding), general'),
('11195', '3.80', 11, 'Farming, rice, planting, grain milling activities'),
('11210', '3.50', 11, 'Farming, milking by hand, cleaning pails, moderate effort'),
('11220', '1.30', 11, 'Farming, milking by machine, light effort'),
('11240', '8.00', 11, 'Fire fighter, general'),
('11244', '6.80', 11, 'Fire fighter, rescue victim, automobile accident, using pike pole'),
('11245', '8.00', 11, 'Fire fighter, raising and climbing ladder with full gear, simulated fire supression'),
('11246', '9.00', 11, 'Fire fighter, hauling hoses on ground, carrying/hoisting equipment, breaking down walls etc., wearing full gear'),
('11247', '3.50', 11, 'Fishing, commercial, light effort'),
('11248', '5.00', 11, 'Fishing, commercial, moderate effort'),
('11249', '7.00', 11, 'Fishing, commercial, vigorous effort'),
('11250', '17.50', 11, 'Forestry, ax chopping, very fast, 1.25 kg axe, 51 blows/min, extremely vigorous effort'),
('11260', '5.00', 11, 'Forestry, ax chopping, slow, 1.25 kg axe, 19 blows/min, moderate effort'),
('11262', '8.00', 11, 'Forestry, ax chopping, fast, 1.25 kg axe, 35 blows/min, vigorous effort'),
('11264', '4.50', 11, 'Forestry, moderate effort (e.g., sawing wood with power saw, weeding, hoeing)'),
('11266', '8.00', 11, 'Forestry, vigorous effort (e.g., barking, felling, or trimming trees, carrying or stacking logs, planting seeds, sawing lumber by hand)'),
('11370', '4.50', 11, 'Furriery'),
('11375', '4.00', 11, 'Garbage collector, walking, dumping bins into truck'),
('11378', '1.80', 11, 'Hairstylist (e.g., plaiting hair, manicure, make-up artist)'),
('11380', '7.30', 11, 'Horse grooming, including feeding, cleaning stalls, bathing, brushing, clipping, longeing and exercising horses'),
('11381', '4.30', 11, 'Horse, feeding, watering, cleaning stalls, implied walking and lifting loads'),
('11390', '7.30', 11, 'Horse racing, galloping'),
('11400', '5.80', 11, 'Horse racing, trotting'),
('11410', '3.80', 11, 'Horse racing, walking'),
('11413', '3.00', 11, 'Kitchen maid'),
('11415', '4.00', 11, 'Lawn keeper, yard work, general'),
('11418', '3.30', 11, 'Laundry worker'),
('11420', '3.00', 11, 'Locksmith'),
('11430', '3.00', 11, 'Machine tooling (e.g., machining, working sheet metal, machine fitter, operating lathe, welding) light-to-moderate effort'),
('11450', '5.00', 11, 'Machine tooling, operating punch press, moderate effort'),
('11472', '1.80', 11, 'Manager, property'),
('11475', '2.80', 11, 'Manual or unskilled labor, general, light effort'),
('11476', '4.50', 11, 'Manual or unskilled labor, general, moderate effort'),
('11477', '6.50', 11, 'Manual or unskilled labor, general, vigorous effort'),
('11480', '4.30', 11, 'Masonry, concrete, moderate effort'),
('11482', '2.50', 11, 'Masonry, concrete, light effort'),
('11485', '4.00', 11, 'Massage therapist, standing'),
('11490', '7.50', 11, 'Moving, carrying or pushing heavy objects, 75 lbs or more, only active time (e.g., desks, moving van work)'),
('11495', '12.00', 11, 'Skindiving or SCUBA diving as a frogman, Navy Seal'),
('11500', '2.50', 11, 'Operating heavy duty equipment, automated, not driving'),
('11510', '4.50', 11, 'Orange grove work, picking fruit'),
('11514', '3.30', 11, 'Painting,house, furniture, moderate effort'),
('11516', '3.00', 11, 'Plumbing activities'),
('11520', '2.00', 11, 'Printing, paper industry worker, standing'),
('11525', '2.50', 11, 'Police, directing traffic, standing'),
('11526', '2.50', 11, 'Police, driving a squad car, sitting'),
('11527', '1.30', 11, 'Police, riding in a squad car, sitting'),
('11528', '4.00', 11, 'Police, making an arrest, standing'),
('11529', '2.30', 11, 'Postal carrier, walking to deliver mail'),
('11530', '2.00', 11, 'Shoe repair, general'),
('11540', '7.80', 11, 'Shoveling, digging ditches'),
('11550', '8.80', 11, 'Shoveling, more than 16 lbs/minute, deep digging, vigorous effort'),
('11560', '5.00', 11, 'Shoveling, less than 10 lbs/minute, moderate effort'),
('11570', '6.50', 11, 'Shoveling, 10 to 15 lbs/minute, vigorous effort'),
('11580', '1.50', 11, 'Sitting tasks, light effort (e.g., office work, chemistry lab work, computer work, light assembly repair, watch repair, reading, desk work)'),
('11585', '1.50', 11, 'Sitting meetings, light effort, general, and/or with talking involved (e.g., eating at a business meeting)'),
('11590', '2.50', 11, 'Sitting tasks, moderate effort (e.g., pushing heavy levers, riding mower/forklift, crane operation)'),
('11593', '2.80', 11, 'Sitting, teaching stretching or yoga, or light effort exercise class'),
('11600', '3.00', 11, 'Standing tasks, light effort (e.g., bartending, store clerk, assembling, filing, duplicating, librarian, putting up a Christmas tree, standing and talking at work, changing clothes when teaching physical education, standing)'),
('11610', '3.00', 11, 'Standing, light/moderate effort (e.g., assemble/repair heavy parts, welding,stocking parts,auto repair,standing, packing boxes, nursing patient care)'),
('11615', '4.50', 11, 'Standing, moderate effort, lifting items continuously, 10 to 20 lbs, with limited walking or resting'),
('11620', '3.50', 11, 'Standing, moderate effort, intermittent lifting 50 lbs, hitch/twisting ropes'),
('11630', '4.50', 11, 'Standing, moderate/heavy tasks (e.g., lifting more than 50 lbs, masonry, painting, paper hanging)'),
('11708', '5.30', 11, 'Steel mill, moderate effort (e.g., fettling, forging, tipping molds)'),
('11710', '8.30', 11, 'Steel mill, vigorous effort (e.g., hand rolling, merchant mill rolling, removing slag, tending furnace)'),
('11720', '2.30', 11, 'Tailoring, cutting fabric'),
('11730', '2.50', 11, 'Tailoring, general'),
('11740', '1.80', 11, 'Tailoring, hand sewing'),
('11750', '2.50', 11, 'Tailoring, machine sewing'),
('11760', '3.50', 11, 'Tailoring, pressing'),
('11763', '2.00', 11, 'Tailoring, weaving, light effort (e.g., finishing operations, washing, dyeing, inspecting cloth, counting yards, paperwork)'),
('11765', '4.00', 11, 'Tailoring, weaving, moderate effort (e.g., spinning and weaving operations, delivering boxes of yam to spinners, loading of warp bean, pinwinding, conewinding, warping, cloth cutting)'),
('11766', '6.50', 11, 'Truck driving, loading and unloading truck, tying down load, standing, walking and carrying heavy loads'),
('11767', '2.00', 11, 'Truch, driving delivery truck, taxi, shuttlebus, school bus'),
('11770', '1.30', 11, 'Typing, electric, manual or computer'),
('11780', '6.30', 11, 'Using heavy power tools such as pneumatic tools (e.g., jackhammers, drills)'),
('11790', '8.00', 11, 'Using heavy tools (not power) such as shovel, pick, tunnel bar, spade'),
('11791', '2.00', 11, 'Walking on job, less than 2.0 mph, very slow speed, in office or lab area'),
('11792', '3.50', 11, 'Walking on job, 3.0 mph, in office, moderate speed, not carrying anything'),
('11793', '4.30', 11, 'Walking on job, 3.5 mph, in office, brisk speed, not carrying anything'),
('11795', '3.50', 11, 'Walking on job, 2.5 mph, slow speed and carrying light objects less than 25 lbs'),
('11796', '3.00', 11, 'Walking, gathering things at work, ready to leave'),
('11797', '3.80', 11, 'Walking, 2.5 mph, slow speed, carrying heavy objects more than 25 lbs'),
('11800', '4.50', 11, 'Walking, 3.0 mph, moderately and carrying light objects less than 25 lbs'),
('11805', '3.50', 11, 'Walking, pushing a wheelchair'),
('11810', '4.80', 11, 'Walking, 3.5 mph, briskly and carrying objects less than 25 lbs'),
('11820', '5.00', 11, 'Walking or walk downstairs or standing, carrying objects about 25 to 49 lbs'),
('11830', '6.50', 11, 'Walking or walk downstairs or standing, carrying objects about 50 to 74 lbs'),
('11840', '7.50', 11, 'Walking or walk downstairs or standing, carrying objects about 75 to 99 lbs'),
('11850', '8.50', 11, 'Walking or walk downstairs or standing, carrying objects about 100 lbs or more'),
('11870', '3.00', 11, 'Working in scene shop, theater actor, backstage employee'),
('12010', '6.00', 12, 'Jog/walk combination (jogging component of less than 10 minutes) (Taylor Code 180)'),
('12020', '7.00', 12, 'Jogging, general'),
('12025', '8.00', 12, 'Jogging, in place'),
('12027', '4.50', 12, 'Jogging, on a mini-tramp'),
('12029', '6.00', 12, 'Running, 4 mph (13 min/mile)'),
('12030', '8.30', 12, 'Running, 5 mph (12 min/mile)'),
('12040', '9.00', 12, 'Running, 5.2 mph (11.5 min/mile)'),
('12050', '9.80', 12, 'Running, 6 mph (10 min/mile)'),
('12060', '10.50', 12, 'Running, 6.7 mph (9 min/mile)'),
('12070', '11.00', 12, 'Running, 7 mph (8.5 min/mile)'),
('12080', '11.50', 12, 'Running, 7.5 mph (8 min/mile)'),
('12090', '11.80', 12, 'Running, 8 mph (7.5 min/mile)'),
('12100', '12.30', 12, 'Running, 8.6 mph (7 min/mile)'),
('12110', '12.80', 12, 'Running, 9 mph (6.5 min/mile)'),
('12120', '14.50', 12, 'Running, 10 mph (6 min/mile)'),
('12130', '16.00', 12, 'Running, 11 mph (5.5 min/mile)'),
('12132', '19.00', 12, 'Running, 12 mph (5 min/mile)'),
('12134', '19.80', 12, 'Running, 13 mph (4.6 min/mile)'),
('12135', '23.00', 12, 'Running, 14 mph (4.3 min/mile)'),
('12140', '9.00', 12, 'Running, cross country'),
('12150', '8.00', 12, 'Running, (Taylor code 200)'),
('12170', '15.00', 12, 'Running, stairs, up'),
('12180', '10.00', 12, 'Running, on a track, team practice'),
('12190', '8.00', 12, 'Running, training, pushing a wheelchair or baby carrier'),
('12200', '13.30', 12, 'Running, marathon'),
('13000', '2.30', 13, 'Getting ready for bed, general, standing'),
('13009', '1.80', 13, 'Sitting on toilet, eliminating while standing or squating'),
('13010', '1.50', 13, 'Bathing, sitting'),
('13020', '2.50', 13, 'Dressing, undressing, standing or sitting'),
('13030', '1.50', 13, 'Eating, sitting'),
('13035', '2.00', 13, 'Talking and eating or eating only, standing'),
('13036', '1.50', 13, 'Taking medication, sitting or standing'),
('13040', '2.00', 13, 'Grooming, washing hands, shaving, brushing teeth, putting on make-up, sitting or standing'),
('13045', '2.50', 13, 'Hairstyling, standing'),
('13046', '1.30', 13, 'Having hair or nails done by someone else, sitting'),
('13050', '2.00', 13, 'Showering, toweling off, standing'),
('14010', '2.80', 14, 'Active, vigorous effort'),
('14020', '1.80', 14, 'General, moderate effort'),
('14030', '1.30', 14, 'Passive, light effort, kissing, hugging'),
('15000', '5.50', 15, 'Alaska Native Games, Eskimo Olympics, general'),
('15010', '4.30', 15, 'Archery, non-hunting'),
('15020', '7.00', 15, 'Badminton, competitive (Taylor Code 450)'),
('15030', '5.50', 15, 'Badminton, social singles and doubles, general'),
('15040', '8.00', 15, 'Basketball, game (Taylor Code 490)'),
('15050', '6.00', 15, 'Basketball, non-game, general (Taylor Code 480)'),
('15055', '6.50', 15, 'Basketball, general'),
('15060', '7.00', 15, 'Basketball, officiating (Taylor Code 500)'),
('15070', '4.50', 15, 'Basketball, shooting baskets'),
('15072', '9.30', 15, 'Basketball, drills, practice'),
('15075', '7.80', 15, 'Basketball, wheelchair'),
('15080', '2.50', 15, 'Billiards'),
('15090', '3.00', 15, 'Bowling (Taylor Code 390)'),
('15092', '3.80', 15, 'Bowling, indoor, bowling alley'),
('15100', '12.80', 15, 'Boxing, in ring, general'),
('15110', '5.50', 15, 'Boxing, punching bag'),
('15120', '7.80', 15, 'Boxing, sparring'),
('15130', '7.00', 15, 'Broomball'),
('15135', '5.80', 15, 'Children\'s games, adults playing (e.g., hopscotch, 4-square, dodgeball, playground apparatus, t-ball, tetherball, marbles, arcade games), moderate effort'),
('15138', '6.00', 15, 'Cheerleading, gymnastic moves, competitive'),
('15140', '4.00', 15, 'Coaching, football, soccer, basketball, baseball, swimming, etc.'),
('15142', '8.00', 15, 'Coaching, actively playing sport with players'),
('15150', '4.80', 15, 'Cricket, batting, bowling, fielding'),
('15160', '3.30', 15, 'Croquet'),
('15170', '4.00', 15, 'Curling'),
('15180', '2.50', 15, 'Darts, wall or lawn'),
('15190', '6.00', 15, 'Drag racing, pushing or driving a car'),
('15192', '8.50', 15, 'Auto racing, open wheel'),
('15200', '6.00', 15, 'Fencing'),
('15210', '8.00', 15, 'Football, competitive'),
('15230', '8.00', 15, 'Football, touch, flag, general (Taylor Code 510)'),
('15232', '4.00', 15, 'Football, touch, flag, light effort'),
('15235', '2.50', 15, 'Football or baseball, playing catch'),
('15240', '3.00', 15, 'Frisbee playing, general'),
('15250', '8.00', 15, 'Frisbee, ultimate'),
('15255', '4.80', 15, 'Golf, general'),
('15265', '4.30', 15, 'Golf, walking, carrying clubs'),
('15270', '3.00', 15, 'Golf, miniature, driving range'),
('15285', '5.30', 15, 'Golf, walking, pulling clubs'),
('15290', '3.50', 15, 'Golf, using power cart (Taylor Code 070)'),
('15300', '3.80', 15, 'Gymnastics, general'),
('15310', '4.00', 15, 'Hacky sack'),
('15320', '12.00', 15, 'Handball, general (Taylor Code 520)'),
('15330', '8.00', 15, 'Handball, team'),
('15335', '4.00', 15, 'High ropes course, multiple elements'),
('15340', '3.50', 15, 'Hang gliding'),
('15350', '7.80', 15, 'Hockey, field'),
('15360', '8.00', 15, 'Hockey, ice, general'),
('15362', '10.00', 15, 'Hockey, ice, competitive'),
('15370', '5.50', 15, 'Horseback riding, general'),
('15375', '4.30', 15, 'Horse chores, feeding, watering, cleaning stalls, implied walking and lifting loads'),
('15380', '4.50', 15, 'Saddling, cleaning, grooming, harnessing and unharnessing horse'),
('15390', '5.80', 15, 'Horseback riding, trotting'),
('15395', '7.30', 15, 'Horseback riding, canter or gallop'),
('15400', '3.80', 15, 'Horseback riding,walking'),
('15402', '9.00', 15, 'Horseback riding, jumping'),
('15408', '1.80', 15, 'Horse cart, driving, standing or sitting'),
('15410', '3.00', 15, 'Horseshoe pitching, quoits'),
('15420', '12.00', 15, 'Jai alai'),
('15425', '5.30', 15, 'Martial arts, different types, slower pace, novice performers, practice'),
('15430', '10.30', 15, 'Martial arts, different types, moderate pace (e.g., judo, jujitsu, karate, kick boxing, tae kwan do, tai-bo, Muay Thai boxing)'),
('15440', '4.00', 15, 'Juggling'),
('15450', '7.00', 15, 'Kickball'),
('15460', '8.00', 15, 'Lacrosse'),
('15465', '3.30', 15, 'Lawn bowling, bocce ball, outdoor'),
('15470', '4.00', 15, 'Moto-cross, off-road motor sports, all-terrain vehicle, general'),
('15480', '9.00', 15, 'Orienteering'),
('15490', '10.00', 15, 'Paddleball, competitive'),
('15500', '6.00', 15, 'Paddleball, casual, general (Taylor Code 460)'),
('15510', '8.00', 15, 'Polo, on horseback'),
('15520', '10.00', 15, 'Racquetball, competitive'),
('15530', '7.00', 15, 'Racquetball, general (Taylor Code 470)'),
('15533', '8.00', 15, 'Rock or mountain climbing (Taylor Code 470) (Formerly code = 17120)'),
('15535', '7.50', 15, 'Rock climbing, ascending rock, high difficulty'),
('15537', '5.80', 15, 'Rock climbing, ascending or traversing rock, low-to-moderate difficulty'),
('15540', '5.00', 15, 'Rock climbing, rappelling'),
('15542', '4.00', 15, 'Rodeo sports, general, light effort'),
('15544', '5.50', 15, 'Rodeo sports, general, moderate effort'),
('15546', '7.00', 15, 'Rodeo sports, general, vigorous effort'),
('15550', '12.30', 15, 'Rope jumping, fast pace, 120-160 skips/min'),
('15551', '11.80', 15, 'Rope jumping, moderate pace, 100-120 skips/min, general, 2 foot skip, plain bounce'),
('15552', '8.80', 15, 'Rope jumping, slow pace, < 100 skips/min, 2 foot skip, rhythm bounce'),
('15560', '8.30', 15, 'Rugby, union, team, competitive'),
('15562', '6.30', 15, 'Rugby, touch, non-competitive'),
('15570', '3.00', 15, 'Shuffleboard'),
('15580', '5.00', 15, 'Skateboarding, general, moderate effort'),
('15582', '6.00', 15, 'Skateboarding, competitive, vigorous effort'),
('15590', '7.00', 15, 'Skating, roller (Taylor Code 360)'),
('15591', '7.50', 15, 'Rollerblading, in-line skating, 14.4 km/h (9.0 mph), recreational pace'),
('15592', '9.80', 15, 'Rollerblading, in-line skating, 17.7 km/h (11.0 mph), moderate pace, exercise training'),
('15593', '12.30', 15, 'Rollerblading, in-line skating, 21.0 to 21.7 km/h (13.0 to 13.6 mph), fast pace, exercise training'),
('15594', '14.00', 15, 'Rollerblading, in-line skating, 24.0 km/h (15.0 mph), maximal effort'),
('15600', '3.50', 15, 'Skydiving, base jumping, bungee jumping'),
('15605', '10.00', 15, 'Soccer, competitive'),
('15610', '7.00', 15, 'Soccer, casual, general (Taylor Code 540)'),
('15620', '5.00', 15, 'Softball or baseball, fast or slow pitch, general (Taylor Code 440)'),
('15625', '4.00', 15, 'Softball, practice'),
('15630', '4.00', 15, 'Softball, officiating'),
('15640', '6.00', 15, 'Softball,pitching'),
('15645', '3.30', 15, 'Sports spectator, very excited, emotional, physically moving'),
('15650', '12.00', 15, 'Squash (Taylor Code 530)'),
('15652', '7.30', 15, 'Squash, general'),
('15660', '4.00', 15, 'Table tennis, ping pong (Taylor Code 410)'),
('15670', '3.00', 15, 'Tai chi, qi gong, general'),
('15672', '1.50', 15, 'Tai chi, qi gong, sitting, light effort'),
('15675', '7.30', 15, 'Tennis, general'),
('15680', '6.00', 15, 'Tennis, doubles (Taylor Code 430)'),
('15685', '4.50', 15, 'Tennis, doubles'),
('15690', '8.00', 15, 'Tennis, singles (Taylor Code 420)'),
('15695', '5.00', 15, 'Tennis, hitting balls, non-game play, moderate effort'),
('15700', '3.50', 15, 'Trampoline, recreational'),
('15702', '4.50', 15, 'Trampoline, competitive'),
('15710', '4.00', 15, 'Volleyball (Taylor Code 400)'),
('15711', '6.00', 15, 'Volleyball, competitive, in gymnasium'),
('15720', '3.00', 15, 'Volleyball, non-competitive, 6 - 9 member team, general'),
('15725', '8.00', 15, 'Volleyball, beach, in sand'),
('15730', '6.00', 15, 'Wrestling (one match = 5 minutes)'),
('15731', '7.00', 15, 'Wallyball, general'),
('15732', '4.00', 15, 'Track and field (e.g., shot, discus, hammer throw)'),
('15733', '6.00', 15, 'Track and field (e.g., high jump, long jump, triple jump, javelin, pole vault)'),
('15734', '10.00', 15, 'Track and field (e.g., steeplechase, hurdles)'),
('16010', '2.50', 16, 'Automobile or light truck (not a semi) driving'),
('16015', '1.30', 16, 'Riding in a car or truck'),
('16016', '1.30', 16, 'Riding in a bus or train'),
('16020', '1.80', 16, 'Flying airplane or helicopter'),
('16030', '3.50', 16, 'Motor scooter, motorcycle'),
('16035', '6.30', 16, 'Pulling rickshaw'),
('16040', '6.00', 16, 'Pushing plane in and out of hangar'),
('16050', '2.50', 16, 'Truck, semi, tractor, > 1 ton, or bus, driving'),
('16060', '3.50', 16, 'Walking for transportation, 2.8-3.2 mph, level, moderate pace, firm surface'),
('17010', '7.00', 17, 'Backpacking (Taylor Code 050)'),
('17012', '7.80', 17, 'Backpacking, hiking or organized walking with a daypack'),
('17020', '5.00', 17, 'Carrying 15 pound load (e.g. suitcase), level ground or downstairs'),
('17021', '2.30', 17, 'Carrying 15 lb child, slow walking'),
('17025', '8.30', 17, 'Carrying load upstairs, general'),
('17026', '5.00', 17, 'Carrying 1 to 15 lb load, upstairs'),
('17027', '6.00', 17, 'Carrying 16 to 24 lb load, upstairs'),
('17028', '8.00', 17, 'Carrying 25 to 49 lb load, upstairs'),
('17029', '10.00', 17, 'Carrying 50 to 74 lb load, upstairs'),
('17030', '12.00', 17, 'Carrying > 74 lb load, upstairs'),
('17031', '3.50', 17, 'Loading /unloading a car, implied walking'),
('17033', '6.30', 17, 'Climbing hills, no load'),
('17035', '6.50', 17, 'Climbing hills with 0 to 9 lb load'),
('17040', '7.30', 17, 'Climbing hills with 10 to 20 lb load'),
('17050', '8.30', 17, 'Climbing hills with 21 to 42 lb load'),
('17060', '9.00', 17, 'Climbing hills with 42+ lb load'),
('17070', '3.50', 17, 'Descending stairs'),
('17080', '6.00', 17, 'Hiking, cross country (Taylor Code 040)'),
('17082', '5.30', 17, 'Hiking or walking at a normal pace through fields and hillsides'),
('17085', '2.50', 17, 'Bird watching, slow walk'),
('17088', '4.50', 17, 'Marching, moderate speed, military, no pack'),
('17090', '8.00', 17, 'Marching rapidly, military, no pack'),
('17100', '4.00', 17, 'Pushing or pulling stroller with child or walking with children, 2.5 to 3.1 mph'),
('17105', '3.80', 17, 'Pushing a wheelchair, non-occupational'),
('17110', '6.50', 17, 'Race walking'),
('17130', '8.00', 17, 'Stair climbing, using or climbing up ladder (Taylor Code 030)'),
('17133', '4.00', 17, 'Stair climbing, slow pace'),
('17134', '8.80', 17, 'Stair climbing, fast pace'),
('17140', '5.00', 17, 'Using crutches'),
('17150', '2.00', 17, 'Walking, household'),
('17151', '2.00', 17, 'Walking, less than 2.0 mph, level, strolling, very slow'),
('17152', '2.80', 17, 'Walking, 2.0 mph, level, slow pace, firm surface'),
('17160', '3.50', 17, 'Walking for pleasure (Taylor Code 010)'),
('17161', '2.50', 17, 'Walking from house to car or bus, from car or bus to go places, from car or bus to and from the worksite'),
('17162', '2.50', 17, 'Walking to neighbor\'s house or family\'s house for social reasons'),
('17165', '3.00', 17, 'Walking the dog'),
('17170', '3.00', 17, 'Walking, 2.5 mph, level, firm surface'),
('17180', '3.30', 17, 'Walking, 2.5 mph, downhill'),
('17190', '3.50', 17, 'Walking, 2.8 to 3.2 mph, level, moderate pace, firm surface'),
('17200', '4.30', 17, 'Walking, 3.5 mph, level, brisk, firm surface, walking for exercise'),
('17210', '5.30', 17, 'Walking, 2.9 to 3.5 mph, uphill, 1 to 5% grade'),
('17211', '8.00', 17, 'Walking, 2.9 to 3.5 mph, uphill, 6% to 15% grade'),
('17220', '5.00', 17, 'Walking, 4.0 mph, level, firm surface, very brisk pace'),
('17230', '7.00', 17, 'Walking, 4.5 mph, level, firm surface, very, very brisk'),
('17231', '8.30', 17, 'Walking, 5.0 mph, level, firm surface'),
('17235', '9.80', 17, 'Walking, 5.0 mph, uphill, 3% grade'),
('17250', '3.50', 17, 'Walking, for pleasure, work break'),
('17260', '4.80', 17, 'Walking, grass track'),
('17262', '4.50', 17, 'Walking, normal pace, plowed field or sand'),
('17270', '4.00', 17, 'Walking, to work or class (Taylor Code 015)'),
('17280', '2.50', 17, 'Walking, to and from an outhouse'),
('17302', '4.80', 17, 'Walking, for exercise, 3.5 to 4 mph, with ski poles, Nordic walking, level, moderate pace'),
('17305', '9.50', 17, 'Walking, for exercise, 5.0 mph, with ski poles, Nordic walking, level, fast pace'),
('17310', '6.80', 17, 'Walking, for exercise, with ski poles, Nordic walking, uphill'),
('17320', '6.00', 17, 'Walking, backwards, 3.5 mph, level'),
('17325', '8.00', 17, 'Walking, backwards, 3.5 mph, uphill, 5% grade'),
('18010', '2.50', 18, 'Boating, power, driving'),
('18012', '1.30', 18, 'Boating, power, passenger, light'),
('18020', '4.00', 18, 'Canoeing, on camping trip (Taylor Code 270)'),
('18025', '3.30', 18, 'Canoeing, harvesting wild rice, knocking rice off the stalks'),
('18030', '7.00', 18, 'Canoeing, portaging'),
('18040', '2.80', 18, 'Canoeing, rowing, 2.0-3.9 mph, light effort'),
('18050', '5.80', 18, 'Canoeing, rowing, 4.0-5.9 mph, moderate effort'),
('18060', '12.50', 18, 'Canoeing, rowing, kayaking, competition, >6 mph, vigorous effort'),
('18070', '3.50', 18, 'Canoeing, rowing, for pleasure, general (Taylor Code 250)'),
('18080', '12.00', 18, 'Canoeing, rowing, in competition, or crew or sculling (Taylor Code 260)'),
('18090', '3.00', 18, 'Diving, springboard or platform'),
('18100', '5.00', 18, 'Kayaking, moderate effort'),
('18110', '4.00', 18, 'Paddle boat'),
('18120', '3.00', 18, 'Sailing, boat and board sailing, windsurfing, ice sailing, general (Taylor Code 235)'),
('18130', '4.50', 18, 'Sailing, in competition');
INSERT INTO `activity` (`code`, `mets`, `category_id`, `description`) VALUES
('18140', '3.30', 18, 'Sailing, Sunfish/Laser/Hobby Cat, Keel boats, ocean sailing, yachting, leisure'),
('18150', '6.00', 18, 'Skiing, water or wakeboarding (Taylor Code 220)'),
('18160', '7.00', 18, 'Jet skiing, driving, in water'),
('18180', '15.80', 18, 'Skindiving, fast'),
('18190', '11.80', 18, 'Skindiving, moderate'),
('18200', '7.00', 18, 'Skindiving, scuba diving, general (Taylor Code 310)'),
('18210', '5.00', 18, 'Snorkeling (Taylor Code 310)'),
('18220', '3.00', 18, 'Surfing, body or board, general'),
('18222', '5.00', 18, 'Surfing, body or board, competitive'),
('18225', '6.00', 18, 'Paddle boarding, standing'),
('18230', '9.80', 18, 'Swimming laps, freestyle, fast, vigorous effort'),
('18240', '5.80', 18, 'Swimming laps, freestyle, front crawl, slow, light or moderate effort'),
('18250', '9.50', 18, 'Swimming, backstroke, general, training or competition'),
('18255', '4.80', 18, 'Swimming, backstroke, recreational'),
('18260', '10.30', 18, 'Swimming, breaststroke, general, training or competition'),
('18265', '5.30', 18, 'Swimming, breaststroke, recreational'),
('18270', '13.80', 18, 'Swimming, butterfly, general'),
('18280', '10.00', 18, 'Swimming, crawl, fast speed, ~75 yards/minute, vigorous effort'),
('18290', '8.30', 18, 'Swimming, crawl, medium speed, ~50 yards/minute, vigorous effort'),
('18300', '6.00', 18, 'Swimming, lake, ocean, river (Taylor Codes 280, 295)'),
('18310', '6.00', 18, 'Swimming, leisurely, not lap swimming, general'),
('18320', '7.00', 18, 'Swimming, sidestroke, general'),
('18330', '8.00', 18, 'Swimming, synchronized'),
('18340', '9.80', 18, 'Swimming, treading water, fast, vigorous effort'),
('18350', '3.50', 18, 'Swimming, treading water, moderate effort, general'),
('18352', '2.30', 18, 'Tubing, floating on a river, general'),
('18355', '5.50', 18, 'Water aerobics, water calisthenics'),
('18360', '10.00', 18, 'Water polo'),
('18365', '3.00', 18, 'Water volleyball'),
('18366', '9.80', 18, 'Water jogging'),
('18367', '2.50', 18, 'Water walking, light effort, slow pace'),
('18368', '4.50', 18, 'Water walking, moderate effort, moderate pace'),
('18369', '6.80', 18, 'Water walking, vigorous effort, brisk pace'),
('18370', '5.00', 18, 'Whitewater rafting, kayaking, or canoeing'),
('18380', '5.00', 18, 'Windsurfing, not pumping for speed'),
('18385', '11.00', 18, 'Windsurfing or kitesurfing, crossing trial'),
('18390', '13.50', 18, 'Windsurfing, competition, pumping for speed'),
('19005', '7.50', 19, 'Dog sledding, mushing'),
('19006', '2.50', 19, 'Dog sledding, passenger'),
('19010', '6.00', 19, 'Moving ice house, set up/drill holes'),
('19011', '2.00', 19, 'Ice fishing, sitting'),
('19018', '0.00', 19, 'Skating, ice dancing'),
('19020', '5.50', 19, 'Skating, ice, 9 mph or less'),
('19030', '7.00', 19, 'Skating, ice, general (Taylor Code 360)'),
('19040', '9.00', 19, 'Skating, ice, rapidly, more than 9 mph, not competitive'),
('19050', '13.30', 19, 'Skating, speed, competitive'),
('19060', '7.00', 19, 'Ski jumping, climb up carrying skis'),
('19075', '7.00', 19, 'Skiing, general'),
('19080', '6.80', 19, 'Skiing, cross country, 2.5 mph, slow or light effort, ski walking'),
('19090', '9.00', 19, 'Skiing, cross country, 4.0-4.9 mph, moderate speed and effort, general'),
('19100', '12.50', 19, 'Skiing, cross country, 5.0-7.9 mph, brisk speed, vigorous effort'),
('19110', '15.00', 19, 'Skiing, cross country, >8.0 mph, elite skier, racing'),
('19130', '15.50', 19, 'Skiing, cross country, hard snow, uphill, maximum, snow mountaineering'),
('19135', '13.30', 19, 'Skiing, cross-country, skating'),
('19140', '13.50', 19, 'Skiing, cross-country, biathlon, skating technique'),
('19150', '4.30', 19, 'Skiing, downhill, alpine or snowboarding, light effort, active time only'),
('19160', '5.30', 19, 'Skiing, downhill, alpine or snowboarding, moderate effort, general, active time only'),
('19170', '8.00', 19, 'Skiing, downhill, vigorous effort, racing'),
('19175', '12.50', 19, 'Skiing, roller, elite racers'),
('19180', '7.00', 19, 'Sledding, tobogganing, bobsledding, luge (Taylor Code 370)'),
('19190', '5.30', 19, 'Snow shoeing, moderate effort'),
('19192', '10.00', 19, 'Snow shoeing, vigorous effort'),
('19200', '3.50', 19, 'Snowmobiling, driving, moderate'),
('19202', '2.00', 19, 'Snowmobiling, passenger'),
('19252', '5.30', 19, 'Snow shoveling, by hand, moderate effort'),
('19254', '7.50', 19, 'Snow shoveling, by hand, vigorous effort'),
('19260', '2.50', 19, 'Snow blower, walking and pushing'),
('20000', '1.30', 20, 'Sitting in church, in service, attending a ceremony, sitting quietly'),
('20001', '2.00', 20, 'Sitting, playing an instrument at church'),
('20005', '1.80', 20, 'Sitting in church, talking or singing, attending a ceremony, sitting, active participation'),
('20010', '1.30', 20, 'Sitting, reading religious materials at home'),
('20015', '1.30', 20, 'Standing quietly in church, attending a ceremony'),
('20020', '2.00', 20, 'Standing, singing in church, attending a ceremony, standing, active participation'),
('20025', '1.30', 20, 'Kneeling in church or at home, praying'),
('20030', '1.80', 20, 'Standing, talking in church'),
('20035', '2.00', 20, 'Walking in church'),
('20036', '2.00', 20, 'Walking, less than 2.0 mph, very slow'),
('20037', '3.50', 20, 'Walking, 3.0 mph, moderate speed, not carrying anything'),
('20038', '4.30', 20, 'Walking, 3.5 mph, brisk speed, not carrying anything'),
('20039', '2.00', 20, 'Walk/stand combination for religious purposes, usher'),
('20040', '5.00', 20, 'Praise with dance or run, spiritual dancing in church'),
('20045', '2.50', 20, 'Serving food at church'),
('20046', '2.00', 20, 'Preparing food at church'),
('20047', '3.30', 20, 'Washing dishes, cleaning kitchen at church'),
('20050', '1.50', 20, 'Eating at church'),
('20055', '2.00', 20, 'Eating/talking at church or standing eating, American Indian Feast days'),
('20060', '3.30', 20, 'Cleaning church'),
('20061', '4.00', 20, 'General yard work at church'),
('20065', '3.50', 20, 'Standing, moderate effort (e.g., lifting heavy objects, assembling at fast rate)'),
('20095', '4.50', 20, 'Standing, moderate-to-heavy effort, manual labor, lifting 50 lbs, heavy maintenance'),
('20100', '1.30', 20, 'Typing, electric, manual, or computer'),
('21000', '1.50', 21, 'Sitting, meeting, general, and/or with talking involved'),
('21005', '1.50', 21, 'Sitting, light office work, in general'),
('21010', '2.50', 21, 'Sitting, moderate work'),
('21015', '2.30', 21, 'Standing, light work (filing, talking, assembling)'),
('21016', '2.00', 21, 'Sitting, child care, only active periods'),
('21017', '3.00', 21, 'Standing, child care, only active periods'),
('21018', '3.50', 21, 'Walk/run play with children, moderate, only active periods'),
('21019', '5.80', 21, 'Walk/run play with children, vigorous, only active periods'),
('21020', '3.00', 21, 'Standing, light/moderate work (e.g., pack boxes, assemble/repair, set up chairs/furniture)'),
('21025', '3.50', 21, 'Standing, moderate (lifting 50 lbs., assembling at fast rate)'),
('21030', '4.50', 21, 'Standing, moderate/heavy work'),
('21035', '1.30', 21, 'Typing, electric, manual, or computer'),
('21040', '2.00', 21, 'Walking, less than 2.0 mph, very slow'),
('21045', '3.50', 21, 'Walking, 3.0 mph, moderate speed, not carrying anything'),
('21050', '4.30', 21, 'Walking, 3.5 mph, brisk speed, not carrying anything'),
('21055', '3.50', 21, 'Walking, 2.5 mph slowly and carrying objects less than 25 lbs'),
('21060', '4.50', 21, 'Walking, 3.0 mph moderately and carrying objects less than 25 lbs, pushing something'),
('21065', '4.80', 21, 'Walking, 3.5 mph, briskly and carrying objects less than 25 lbs'),
('21070', '3.00', 21, 'Walk/stand combination, for volunteer purposes');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Bicycling'),
(2, 'Conditioning Exercise'),
(3, 'Dancing'),
(4, 'Fishing and Hunting'),
(5, 'Home Activities'),
(6, 'Home Repair'),
(7, 'Inactivity quiet/light'),
(8, 'Lawn and Garden'),
(9, 'Miscellaneous'),
(10, 'Music Playing'),
(11, 'Occupation'),
(12, 'Running'),
(13, 'Self Care'),
(14, 'Sexual Activity'),
(15, 'Sports'),
(16, 'Transportation'),
(17, 'Walking'),
(18, 'Water Activities'),
(19, 'Winter Activities'),
(20, 'Religious Activities'),
(21, 'Volunteer Activities');

-- --------------------------------------------------------

--
-- Table structure for table `nutrition`
--

CREATE TABLE `nutrition` (
  `fdcid` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `brandOwner` varchar(255) NOT NULL,
  `protein` decimal(10,0) NOT NULL,
  `totalLipid` decimal(10,0) NOT NULL,
  `carbs` decimal(10,0) NOT NULL,
  `energy` decimal(10,0) NOT NULL,
  `sugar` decimal(10,0) NOT NULL,
  `sodium` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `roster`
--

CREATE TABLE `roster` (
  `rosterID` int(11) NOT NULL,
  `teamID` int(11) NOT NULL,
  `playerID` int(11) NOT NULL,
  `coach` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `teamID` int(11) NOT NULL,
  `teamname` varchar(50) NOT NULL,
  `coachID` int(11) NOT NULL,
  `coachname` int(50) NOT NULL,
  `sport` varchar(50) NOT NULL DEFAULT 'Fitness'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `sex` tinyint(4) NOT NULL DEFAULT 2,
  `age` int(11) DEFAULT NULL,
  `weight` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `heightbin` binary(1) DEFAULT NULL,
  `weightbin` binary(1) DEFAULT NULL,
  `BMR` decimal(10,0) DEFAULT NULL,
  `caloriegoal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `username`, `firstname`, `lastname`, `password`, `sex`, `age`, `weight`, `height`, `heightbin`, `weightbin`, `BMR`, `caloriegoal`) VALUES
(1, 'yuh', 'yuh', 'uh', 'yuh', 2, 7, 4, 444, 0x30, 0x30, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `usertogrocery`
--

CREATE TABLE `usertogrocery` (
  `groceryID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `food1` int(11) NOT NULL,
  `food2` int(11) DEFAULT NULL,
  `food3` int(11) DEFAULT NULL,
  `food4` int(11) DEFAULT NULL,
  `food5` int(11) DEFAULT NULL,
  `food6` int(11) DEFAULT NULL,
  `food7` int(11) DEFAULT NULL,
  `food8` int(11) DEFAULT NULL,
  `food9` int(11) DEFAULT NULL,
  `food10` int(11) DEFAULT NULL,
  `food11` int(11) DEFAULT NULL,
  `food12` int(11) DEFAULT NULL,
  `food13` int(11) DEFAULT NULL,
  `food14` int(11) DEFAULT NULL,
  `food15` int(11) DEFAULT NULL,
  `food16` int(11) DEFAULT NULL,
  `food17` int(11) DEFAULT NULL,
  `food18` int(11) DEFAULT NULL,
  `food19` int(11) DEFAULT NULL,
  `food20` int(11) DEFAULT NULL,
  `food21` int(11) DEFAULT NULL,
  `food22` int(11) DEFAULT NULL,
  `food23` int(11) DEFAULT NULL,
  `food24` int(11) DEFAULT NULL,
  `food25` int(11) DEFAULT NULL,
  `food26` int(11) DEFAULT NULL,
  `food27` int(11) DEFAULT NULL,
  `food28` int(11) DEFAULT NULL,
  `food29` int(11) DEFAULT NULL,
  `food30` int(11) DEFAULT NULL,
  `food31` int(11) DEFAULT NULL,
  `food32` int(11) DEFAULT NULL,
  `food33` int(11) DEFAULT NULL,
  `food34` int(11) DEFAULT NULL,
  `food35` int(11) DEFAULT NULL,
  `food36` int(11) DEFAULT NULL,
  `food37` int(11) DEFAULT NULL,
  `food38` int(11) DEFAULT NULL,
  `food39` int(11) DEFAULT NULL,
  `food40` int(11) DEFAULT NULL,
  `food41` int(11) DEFAULT NULL,
  `food42` int(11) DEFAULT NULL,
  `food43` int(11) DEFAULT NULL,
  `food44` int(11) DEFAULT NULL,
  `food45` int(11) DEFAULT NULL,
  `food46` int(11) DEFAULT NULL,
  `food47` int(11) DEFAULT NULL,
  `food48` int(11) DEFAULT NULL,
  `food49` int(11) DEFAULT NULL,
  `food50` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `usertonutrition`
--

CREATE TABLE `usertonutrition` (
  `userid` int(11) NOT NULL,
  `fdcid` int(11) NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `usertoplans`
--

CREATE TABLE `usertoplans` (
  `userid` int(11) NOT NULL,
  `code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `usertoworkout`
--

CREATE TABLE `usertoworkout` (
  `userid` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp(),
  `duration` int(11) DEFAULT NULL,
  `reps` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`code`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `roster`
--
ALTER TABLE `roster`
  ADD PRIMARY KEY (`rosterID`),
  ADD KEY `fk_team_id` (`teamID`),
  ADD KEY `fk_player_id` (`playerID`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`teamID`),
  ADD KEY `fk_coachid_userid` (`coachID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- Indexes for table `usertogrocery`
--
ALTER TABLE `usertogrocery`
  ADD KEY `fk_utg` (`userID`);

--
-- Indexes for table `usertonutrition`
--
ALTER TABLE `usertonutrition`
  ADD PRIMARY KEY (`userid`,`fdcid`);

--
-- Indexes for table `usertoplans`
--
ALTER TABLE `usertoplans`
  ADD PRIMARY KEY (`userid`,`code`);

--
-- Indexes for table `usertoworkout`
--
ALTER TABLE `usertoworkout`
  ADD PRIMARY KEY (`userid`,`code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity`
--
ALTER TABLE `activity`
  ADD CONSTRAINT `activity_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `roster`
--
ALTER TABLE `roster`
  ADD CONSTRAINT `fk_roster` FOREIGN KEY (`playerID`) REFERENCES `user` (`userID`);

--
-- Constraints for table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `fk_team` FOREIGN KEY (`coachID`) REFERENCES `user` (`userID`);

--
-- Constraints for table `usertogrocery`
--
ALTER TABLE `usertogrocery`
  ADD CONSTRAINT `fk_utg` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- Constraints for table `usertonutrition`
--
ALTER TABLE `usertonutrition`
  ADD CONSTRAINT `fk_utn` FOREIGN KEY (`userid`) REFERENCES `user` (`userID`);

--
-- Constraints for table `usertoplans`
--
ALTER TABLE `usertoplans`
  ADD CONSTRAINT `fk_utp` FOREIGN KEY (`userid`) REFERENCES `user` (`userID`);

--
-- Constraints for table `usertoworkout`
--
ALTER TABLE `usertoworkout`
  ADD CONSTRAINT `fk_utw` FOREIGN KEY (`userid`) REFERENCES `user` (`userID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;